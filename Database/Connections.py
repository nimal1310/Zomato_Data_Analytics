import mysql.connector as mc 


class Connection:
    def __init__(self):
        self.DB="Zomato"
        self.conn=mc.connect(
            host="localhost",
            user="root",
            password="Root",
            database=self.DB
        )
    
    def create_connection(self):
        return self.conn
    
    def get_items(self):
        
        cursor=self.conn.cursor();
        sql=f"select * from items;"
        cursor.execute(sql)
        items=cursor.fetchall();
        print(items)
        self.conn.close()
        return items
    
    def insert_orders(self,user_id,item_id,quantity,address,price):
        
        cursor=self.conn.cursor()
        sql=f"insert into orders (user_id,item_id,quantity,delivery_address) values(%s,%s,%s,%s)"
        cursor.execute(sql,(user_id,item_id,quantity,address))
        
        self.conn.commit()
        #user lastrowid -> it will return the id of auto increment primary key
        order_id=cursor.lastrowid
        
        
        #update order_items table simulateneously
        sql=f"Insert into order_items(order_id,item_id,quantity,price) values(%s,%s,%s,%s)"
        cursor.execute(sql,(order_id,item_id,quantity,price))
        self.conn.commit()

        
        cursor.close()
        self.conn.close()
        print("successful")
        return order_id
       
    def add_payment_history(self,order_id,payment_method,payment_status,amount):
        
        cursor=self.conn.cursor()
        sql=f"Insert into payments(order_id,payment_method,payment_status,amount) values(%s,%s,%s,%s)"
        cursor.execute(sql,(order_id,payment_method,payment_status,amount))
        self.conn.commit()
        cursor.close()
        self.conn.close()
        
        
        