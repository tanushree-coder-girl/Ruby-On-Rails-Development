class CrudNotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notifications_mailer.create_notifications.subject
  #
  def create_notifications(object)
    @object = object
    @object_count = object.class.count  

    mail to: "admin@example.com", subject: "A new entry for #{object.class} has been created"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notifications_mailer.update_notifications.subject
  #
  def update_notifications(object)
    @object = object
    @object_count = object.class.count  

    mail to: "admin@example.com", subject: "An entry for #{object.class} has been updated"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notifications_mailer.delete_notifications.subject
  #
  def delete_notifications(object)
    @object = object
    @object_count = object.class.count  

    mail to: "admin@example.com", subject: "An entry for #{object.class} has been Deleted"
  end
end
