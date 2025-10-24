from flask import Flask,render_template,request,jsonify,session
from Database.Connections import Connection 
import random

app=Flask(__name__)


app.secret_key="password"

@app.route('/')

def index():
    
    c=Connection()
    items=c.get_items()
    return render_template('index.html',items=items)

@app.route('/place_order',methods=['POST'])
def place_order():
    #get connection of order table;
    
    c=Connection()
    user_id_list=[1,2,3]
    user_id=random.choice(user_id_list)
     #order table => orders (user_id, item_id, quantity, delivery_address)
    data=request.get_json()
    items=data['order'][0]
    print("items:",items)

    item_id=items["id"]
    quantity=items["quantity"]
    delivery_address=items["address"]
    price=float(items["price"])
    
    total=int(quantity)*price
    # insert into order table
    order_id=c.insert_orders(user_id,item_id,quantity,delivery_address,price)
    if order_id != None:
        session['order_id']=order_id
        
    print(order_id)
    
    total= price*quantity
    print(total)
    
    return jsonify({'message':'Order placed successfully','total':total})
    
@app.route("/payment_page" ,methods=['GET'])
def payment_page():
    return render_template("payment.html")

@app.route("/payment",methods=['POST'])
def payment():
    total_price=request.form.get('total') 
    payment_method=request.form.get('payment_method')
    c=Connection()
    order_id=session.get("order_id")
    c.add_payment_history(order_id,payment_method,'success',total_price)
    
    return render_template('success.html',total_price=total_price,payment_method=payment_method)

if __name__ =="__main__":
    app.run(debug=True)