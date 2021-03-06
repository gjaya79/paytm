module Paytm
  class TransactionRequest

    @request_params = {
        :mid => '',
        :order_id => '',
        :cust_id => '',
        :industry_type_id => '',
        :channel_id => '',
        :txn_amount => '',
        :mobile_number => '',
        :email => '',
        :website => ''
    }

    class << self
      attr_accessor :request_params
    end

    def self.generate_check_sum(params, mid, merchant_key)
      request_params[:mid] = mid
      request_params.merge!(params)
      modified_params = Hash[ request_params.map{ |k, v| [ k.to_s.upcase, v] } ]
      modified_params.merge!({'CHECKSUM' => EncryptionNewPG.new_pg_checksum(modified_params, merchant_key)})
      modified_params
    end

  end
end

