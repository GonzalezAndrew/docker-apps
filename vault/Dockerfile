FROM vault:1.2.3
LABEL Maintainer="Andrew Gonzalez"
COPY ./scripts/start-server.sh .
COPY ./scripts/init-server.sh .
COPY ./scripts/entrypoint.sh .
COPY ./volumes/config/vault.hcl /vault/config/vault.hcl
COPY ./volumes/logs/vault.logs /vault/logs/vault.logs 
RUN chmod +x ./start-server.sh && chmod +x ./init-server.sh && chmod +x ./entrypoint.sh 
EXPOSE 8200
ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "start" ]
