require 'rails_helper'

RSpec.describe PostHashTag, type: :model do

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:hash_tag)}

end