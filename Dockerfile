FROM centos/ruby-23-centos7
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
USER root
RUN scl enable rh-ruby23 "bundle install"
CMD ["scl", "enable", "rh-ruby23", "./run.sh"]
