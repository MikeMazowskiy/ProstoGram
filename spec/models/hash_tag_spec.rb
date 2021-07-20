require 'rails_helper'

RSpec.describe HashTag, type: :model do

  it { is_expected.to have_many(:post_hash_tags) }
  it { is_expected.to have_many(:posts).through(:post_hash_tags)}

end