class ContactFormCell < Cell::ViewModel
  include SimpleForm::ActionViewExtensions::FormHelper
  include ActionView::RecordIdentifier

  def show
    @contact_form = ContactForm.new
    render
  end
end
