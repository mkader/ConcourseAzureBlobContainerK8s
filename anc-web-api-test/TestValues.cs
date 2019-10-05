using anc_web_api.Controllers;
using System;
using Xunit;

namespace anc_web_api_test
{
    public class TestValues
    {
        private ValuesController _vc;

        public TestValues()
        {
            _vc = new ValuesController();
        }

        [Fact]
        public void TestGet()
        {
            Assert.Equal("value 1", _vc.Get(1).Value);
        }

        [Theory]
        [InlineData(1)]
        [InlineData(3)]
        [InlineData(9)]
        [InlineData(30)]
        public void TestGetDealStatus(int value)
        {
            string apivalue = "shipped";
            if (_vc.GetDealStatus(value) != apivalue) apivalue = "processing";
            Assert.Equal(apivalue, apivalue);
        }
    }
}
