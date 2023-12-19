class FutureDatetimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    unless value.future?
      record.errors[attribute] << (options[:message] || 'must be a future datetime')
    end
  end
end