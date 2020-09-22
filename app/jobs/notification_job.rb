require 'rest-client'
require 'json'
class NotificationJob < ApplicationJob
  queue_as :default

  def perform(cliente_id)
    cliente = Cliente.find(cliente_id)

    body = {
      notification: {
        title: "Se ha adicionado un nuevo Cliente",
        body: "Nombre: #{cliente.name}"
      },
      priority: "high",
      data: {
        click_action: "FLUTTER_NOTIFICATION_CLICK",
        id: "1",
        status: "done",
        cliente: "ruben"
      },
      to:
      "eswcJYcCSbSt8A_0ptsBH4:APA91bEeL4UDj4Wd8yN3httSm9Tjw1obejoR7RReNL_thYD5GqEbg2XFyHXH1d_PlgCZdjBE6wYGSo8zZNW17MU__I5LRUSqRm2ILWtuvw5e41oDfW7iMsT1HFdHEJxtnsac6WgE6NGW"
    }

    response = RestClient::Request.new({
      method: :post,
      url: "https://fcm.googleapis.com/fcm/send",
      payload: body.to_json,
      headers: {content_type: 'application/json', Authorization: "key=#{ENV['FIREBASE']}"}
       }).execute

    puts "Hola enano"
    puts "Hola gordo"
  end
end
