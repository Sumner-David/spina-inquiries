module Spina
  module Inquiries
    module AdminHelpers
      def new_inquiry_label(inquiry)
        last_logged_in = current_spina_user.last_logged_in ||= Time.now

        if inquiry.created_at > last_logged_in && !inquiry.read?
          content_tag :span, "New", class: "alert-label alert-label--right"
        end
      end

      def new_inquiries_count
        last_logged_in = current_spina_user.last_logged_in ||= Time.now
        inquiries = Inquiry.not_marked_as_read.select { |inquiry| inquiry.created_at > last_logged_in }

        content_tag :span, "#{inquiries.count} New", class: "alert-label alert-label--left" if inquiries.any?
      end
    end
  end
end
