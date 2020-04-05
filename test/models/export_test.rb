# frozen_string_literal: true

require 'test_helper'

class ExportTest < ActiveSupport::TestCase
  test 'email presence' do
    assert build(:export, email: nil).invalid?
  end

  test 'email format' do
    assert build(:export, email: 'bilbon.sacquet@email').invalid?
  end

  test 'location or language presence' do
    assert build(:export, location: nil, language: nil).invalid?
    assert build(:export, location: 'Paris', language: nil).valid?
    assert build(:export, location: nil, language: 'Ruby').valid?
  end

  test 'before create #set_uuid' do
    assert create(:export).uuid.present?
  end

  test '#filename' do
    export = create(:export)
    assert_equal "#{export.uuid}.csv", export.filename
  end

  test '#path' do
    export = create(:export)
    assert_equal File.join(Dir.tmpdir, export.filename), export.path
  end
end
