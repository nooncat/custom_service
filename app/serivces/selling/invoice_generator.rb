class Selling
  class InvoiceGenerator
    def initialize(selling)
      @selling = selling

      @av = ActionView::Base.new
      @av.view_paths = ActionController::Base.view_paths

      @av.class_eval do
        include Rails.application.helpers
        include ApplicationHelper
      end
    end

    def call
      pdf = create_pdf_from_html(html_template)

      File.open(path_for_save, 'wb') do |file|
        file << pdf
      end

      File.open(path_for_save)
    end

    private

    def create_pdf_from_html(html)
      WickedPdf.new.pdf_from_string(html, options)
    end

    def html_template
      @av.render :template => 'templates/invoice.slim', layout: nil, locals: { selling: @selling }
    end

    def options
      {
        page_size: 'A4',
        disable_smart_shrinking: true,
        margin: { top: 0, right: 0, bottom: 0, left: 0 }
      }
    end

    def path_for_save
      @path_for_save ||= Rails.root.join('tmp', "#{@selling.id}_invoice.pdf")
    end
  end
end
