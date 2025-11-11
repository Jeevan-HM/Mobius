import os

from flask import Flask, jsonify, render_template, request

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/product")
def product():
    return render_template("product.html")


@app.route("/solutions")
def solutions():
    return render_template("solutions.html")


@app.route("/about")
def about():
    return render_template("about.html")


@app.route("/contact", methods=["GET", "POST"])
def contact():
    if request.method == "POST":
        # Handle form submission
        # In production, you'd send email or save to database here
        return jsonify({"message": "Thank you for contacting us!"}), 200
    return render_template("contact.html")


@app.route("/pricing")
def pricing():
    return render_template("pricing.html")


@app.route("/careers")
def careers():
    return render_template("careers.html")


@app.route("/manufacturing")
def manufacturing():
    return render_template("manufacturing.html")


@app.route("/healthcare")
def healthcare():
    return render_template("healthcare.html")


@app.route("/logistics")
def logistics():
    return render_template("logistics.html")


@app.route("/health")
def health():
    """Health check endpoint for monitoring."""
    return jsonify({"status": "healthy"}), 200


if __name__ == "__main__":
    port = int(os.environ.get("PORT", "8000"))
    app.run(host="0.0.0.0", port=port, debug=False)
