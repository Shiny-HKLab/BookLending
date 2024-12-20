FROM python:3.11

RUN apt-get update
RUN apt-get -y install locales && \
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install libpq5

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

COPY requirements.txt .
RUN pip install --upgrade pip && \
  pip install --upgrade -r requirements.txt
RUN rm requirements.txt

WORKDIR /app-service

CMD ["uvicorn","src.app.main:app", "--host", "0.0.0.0", "--port", "8000"]
