"""
Flask Backend - Data Integration API
Chạy tại http://localhost:5000
React Frontend gọi API từ đây.
"""
from flask import Flask
from flask_cors import CORS

from router import router

app = Flask(__name__)
CORS(app)  # Cho phép React (localhost:3000) gọi API
app.register_blueprint(router)


@app.route("/")
def index():
    return {"msg": "Data Integration API - chạy OK", "docs": "/api/employees"}


if __name__ == "__main__":
    app.run(debug=True, port=5001)
