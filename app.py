from flask import Flask, render_template, request, redirect, session
import mysql.connector


mydb = mysql.connector.connect( 
                user='root',
                password='',
                host='localhost',
                database='bank'
)
app = Flask(__name__)
app.secret_key = "super-secret-key"

@app.route('/' , methods = ['GET' , 'POST'])
def home():
    if request.method == 'POST':
        user_cnic = request.form.get('cnic')
        pin = request.form.get('pin')

        mycursor = mydb.cursor()
        mycursor.execute("SELECT * FROM account WHERE user_cnic = %s" ,(user_cnic,))
        login = mycursor.fetchone()
        try:
            if login[4] == user_cnic or login[5] == pin:
                session['user_cnic']=login[4]
                # session.pop('user')
                return render_template("dashb.html")

        except:
            return redirect ('/')

    return render_template("login.html")

@app.route('/registration' , methods = ["GET" , "POST"])
def registration():
    if request.method == 'POST':
        user_name = request.form.get('name')
        age = request.form.get('age')
        phone_num = request.form.get('phone')
        user_cnic = request.form.get('cnic')
        pin = request.form.get('pin')
        adress = request.form.get('adress')
        balance = 0

        mycursor = mydb.cursor()
        sqlform = "INSERT INTO account(user_name, age, phone_num, user_cnic, pin, adress, balance) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        information = (user_name, age, phone_num, user_cnic, pin, adress, balance)
        mycursor.execute(sqlform, information)
        mydb.commit()

        return render_template("dashb.html")
    return render_template("registration.html")

@app.route('/dashb' , methods = ['GET' , 'POST'])
def dashb():
    if ("user_cnic" in session and session["user_cnic"] != None):
        cnic=session["user_cnic"]
        mycursor = mydb.cursor()
        mycursor.execute("SELECT * FROM account WHERE user_cnic = %s" ,(cnic,))
        dashboard = mycursor.fetchone()
        print(dashboard)

        balance = dashboard[7]

        if request.method == 'POST':
            value=request.form.get("query")
            amount = int(request.form.get("amount"))
            amount = str(amount)
            # draw = int(request.form.get("withdraw"))
            # draw = str(draw)
            if value == "dep":
                balance = dashboard[7] + int(amount)

            if value == "wid":
                balance= dashboard[7] - int(amount)
                        
            sql = ("UPDATE account SET balance = %s WHERE user_cnic = %s")
            sent = (balance, cnic)
            mycursor.execute(sql, sent)
            mydb.commit()

        return render_template("dashb.html")
    
    return render_template('login.html')

@app.route("/logout" , methods = ['GET' , 'POST'])
def logout():

    session.pop('user_cnic')
    return redirect('/')

if __name__ == '__main__':

    app.run(debug=True)