# Use the official Miniconda image as a base
FROM continuumio/miniconda3

# Set working directory in the container
WORKDIR /app

# Copy the environment.yml file to the Docker image
COPY environment.yml ./kaggle.yml

# Initialize Conda and create the environment
RUN conda init bash && conda env create -f /app/kaggle.yml

# Activate the environment and make it the default
RUN echo "conda activate kaggle" >> ~/.bashrc
ENV PATH="/envs/kaggle/bin:$PATH"


# Optionally, set an entry point (e.g., Python shell)
ENTRYPOINT ["python"]
