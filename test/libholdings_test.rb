require 'test_helper'

class LibholdingsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Libholdings::VERSION
  end

  def test_that_it_gets_holdings_info

    r = Libholdings::Request.new
    r.server = 'miami.alma.exlibrisgroup.com'
    r.port = 1921
    r.database_name = '01UOML_INST'
    r.record_id = '9910311107102976'

    holdings = Libholdings::info(r)
    p holdings
    assert_equal(holdings["holdings"]["holding"][0]["callNumber"], "Mfilm 7397")

  end
end
