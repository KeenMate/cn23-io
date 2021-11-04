FROM elixir:1.12-alpine

ARG MIX_ENV

ENV SHELL=/bin/bash

WORKDIR /app
COPY ./_build/${MIX_ENV}/rel/cn23 .

CMD ["./bin/cn23", "start"]