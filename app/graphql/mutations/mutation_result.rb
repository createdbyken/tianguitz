# frozen_string_literal: true

module Mutations
  class MutationResult < BaseMutation
    def self.call(obj: {}, success: true, errors: [])
      obj.merge(success: success, errors: errors)
    end
  end
end