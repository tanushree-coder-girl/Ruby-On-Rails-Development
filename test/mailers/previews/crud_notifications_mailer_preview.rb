# Preview all emails at http://localhost:3000/rails/mailers/crud_notifications_mailer
class CrudNotificationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crud_notifications_mailer/create_notifications
  def create_notifications
    CrudNotificationsMailer.create_notifications
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notifications_mailer/update_notifications
  def update_notifications
    CrudNotificationsMailer.update_notifications
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notifications_mailer/delete_notifications
  def delete_notifications
    CrudNotificationsMailer.delete_notifications
  end

end
