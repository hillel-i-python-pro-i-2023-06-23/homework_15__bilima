FROM python:3.11

ENV PYTHONUNBUFFERED=1

ARG WORKDIR=/wd
ARG USER=user

WORKDIR ${WORKDIR}

RUN useradd --system ${USER} && \
        chown --recursive ${USER} ${WORKDIR}


COPY --chown=${USER} requirements.txt requirements.txt

RUN pip install --upgrade pip && \
    pip install --requirement requirements.txt

COPY --chown=${USER} app.py app.py

USER ${USER}

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "45000"]
