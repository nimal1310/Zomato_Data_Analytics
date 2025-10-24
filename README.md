# 🍽️ Zomato -web app for data analytics

A lightweight **Zomato-style food ordering system** built using **Flask**.  
The app allows users to browse food items, place orders, make payments, and store order & user insights for **future data analytics**.

---

## ✅ Features

- Display food items with images & price  
- Add quantity & place order  
- Payment method selection  
- Store user orders, payments & food details in MySQL  
- Simple & clean UI using HTML, CSS, JavaScript (AJAX)  
- Backend REST-like routes using Flask  

---

## 🏗️ Tech Stack

| Layer | Technology / Tool |
|------|------------------|
| **Frontend** | HTML, CSS, JavaScript (AJAX) |
| **Backend** | Python, Flask |
| **Database** | MySQL (mysql-connector-python) |
| **Analytics Ready** | Order + payment data stored for analysis |
| **Environment** | Python venv (`Zomao_app_etl`) |

---

## 📁 Project Structure
```
│
├── app.py # Flask backend application
├── requirements.txt # Project dependencies
├── zomato.sql # Database schema & tables
│
├── Database/ # MySQL DB connection handlers
│ └── connections.py
│
├── templates/ # Frontend UI pages (Jinja templates)
│ ├── index.html # Menu / order page
│ ├── payment.html # Payment selection page
│ └── success.html # Payment confirmation
│
└── static/
├── css/style.css # Frontend styling
├── js/main.js # AJAX & dynamic UI actions
└── images/ # Food item images

```
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/zomato-mini.git
cd zomato-mini
```
```python
python -m venv Zomao_app_etl

# Windows
Zomao_app_etl\Scripts\activate

# Mac/Linux
source Zomao_app_etl/bin/activate

pip install -r requirements.txt

python app.py
```
# Database 
- The table structures present in `zomato.sql`

📊 Future Enhancements

- Admin dashboard for food management

- Authentication & login for users

- Add multiple items per order (cart system)

- Advanced analytics dashboard


[![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)]()
[![Flask](https://img.shields.io/badge/Flask-Web%20Framework-lightgrey?logo=flask)]()
[![MySQL](https://img.shields.io/badge/Database-MySQL-orange?logo=mysql)]()


