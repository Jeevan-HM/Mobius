.PHONY: help install run docker-build docker-run docker-compose-up docker-compose-down vercel-dev vercel-deploy clean

help:
	@echo "Mobius Flask App - Available Commands:"
	@echo "  make install           - Install Python dependencies"
	@echo "  make run              - Run Flask development server"
	@echo "  make docker-build     - Build Docker image"
	@echo "  make docker-run       - Run Docker container"
	@echo "  make docker-compose-up - Start services with docker-compose"
	@echo "  make docker-compose-down - Stop docker-compose services"
	@echo "  make vercel-dev       - Run Vercel development server"
	@echo "  make vercel-deploy    - Deploy to Vercel production"
	@echo "  make clean            - Remove build artifacts and cache"

install:
	pip install -r requirements.txt

run:
	python app.py

docker-build:
	docker build -t mobius-app .

docker-run:
	docker run -p 5000:5000 mobius-app

docker-compose-up:
	docker-compose up -d

docker-compose-down:
	docker-compose down

vercel-dev:
	vercel dev

vercel-deploy:
	vercel --prod

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	rm -rf build dist .pytest_cache
