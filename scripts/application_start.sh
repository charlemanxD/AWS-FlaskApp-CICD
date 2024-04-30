echo "Running container..."
docker run --name flask_app -d -p 5000:5000 1058264467171.dkr.ecr.us-east-1.amazonaws.com/flaskapp_image:latest
