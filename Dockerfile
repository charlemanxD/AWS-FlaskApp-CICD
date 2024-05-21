# Use an official Python runtime as a parent image
FROM public.ecr.aws/docker/library/python:3.10-slim

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN python -m pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 5000

# Optionally add directories to the PATH
ENV PATH="/app/.local/bin:$PATH"

ENTRYPOINT ["gunicorn"]

# Run gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]