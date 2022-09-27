FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt update && apt upgrade -y && \
	apt install -y build-essential perl wget bioperl ncbi-blast+ clustalw gcc

#install qdd
RUN mkdir /usr/src/QDD && wget -qO - https://people.imbe.fr/~emeglecz/QDDweb/QDD-3.1.2/QDD-3.1.2.tar.gz | tar xfz - -C /usr/src/QDD && \
	cd /usr/src/QDD && \
	ln -s /usr/src/QDD/subprogramQDD.pm /etc/perl/ && \
	ln -s /usr/src/QDD/ncbi_taxonomy.pm /etc/perl/ && \
	mkdir /etc/qdd && ln /usr/src/QDD/set_qdd_default.ini /etc/qdd/set_qdd_default.ini && chmod a+x *.pl

ENV PATH="/usr/src/QDD:$PATH"
