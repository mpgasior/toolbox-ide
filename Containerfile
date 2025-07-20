FROM registry.fedoraproject.org/fedora-toolbox:42

COPY setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

RUN /tmp/setup.sh

RUN rm /tmp/setup.sh

CMD ["bash"]
