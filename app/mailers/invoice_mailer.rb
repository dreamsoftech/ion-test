class InvoiceMailer < ActionMailer::Base
  default from: "admin@amco.com"

  def send_mail(purchase_order)
  	@purchase_order = purchase_order
  	@phase = purchase_order.phase
  	@job_site = @phase.job_site
  	@supervisor = @job_site.user
  	@supplier = @job_site.supplier
  	@line_items = @purchase_order.line_items

    mail(from: @supervisor.email, to: @supplier.email, subject: "New Purchase Order")
  end
end
