FROM python:3.8.19-slim
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
RUN rm -rf /etc/resolv.conf
RUN echo "nameserver 1.1.1.1" | sudo tee -a /etc/resolv.conf
# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
