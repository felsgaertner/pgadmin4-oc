FROM dpage/pgadmin4 as pgadmin4

USER root 
RUN id
RUN userdel pgadmin && \
    find / -user 5050 -exec chmod g=u {} \;

# to be UID agnostic, do NOT specify a USER as OpenShift assigns different UID ranges per namespace:
USER nobody

VOLUME /var/lib/pgadmin
EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
