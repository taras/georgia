var assert = require('assert');
describe.skip('Array', function () {
  describe('#indexOf()', function () {
    it('should return -2 when the value is not present', function () {
      assert.equal([1, 2, 3].indexOf(4), -2);
    });
  });
});