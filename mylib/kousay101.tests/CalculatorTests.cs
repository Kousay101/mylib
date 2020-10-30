using kousay101.lib;
using Xunit;

namespace kousay101.tests
{
    public class CalculatorTests
    {
        [Theory]
        [InlineData(10, 20, 30)]
        [InlineData(1, 2, 3)]
        public void Add(int x, int y, int expected)
        {
            var calculator = new Calculator();
            var result = calculator.Add(x, y);

            Assert.Equal(expected, result);
        }
    }
}
