### My approach to the refactoring

I first measured the test coverage and level of technical debt we had in this code using simplecov and codeclimate. The following were the results.

- Codeclimate classified it's technical debt at class F, meaning the technical debt was so high (technical debt ratio above 50%)
- Test coverage was at 40%
- The update_quality method had a cognitive complexity of 56, exceeding the 5 allowed
- The update_quality method had 45 lines of code, exceeding the 25 allowed
- Had 3 deeply nested control flow statements
- 5 code smells
- Over 50 linting issues


These are the steps I followed to refactor the code
- There was only one test, I could not refactor confidently with only one test, so I first added tests that covered all the existing functionality
- I refactored the deeply nested conditionals into smaller methods that individually covered the functionality of each of the existing items
- I added the update_conjured method which updated the quality of conjured items
- I refactored the small methods into small classes and objects
- I refactored the GildedRose class into a module containing the small classes


In the end, this were the results
- 100% test coverage
- No deply nested conditionals
- No code smells
- No method/class with a cognitive complexity greater than 5
- No method with more than 25 LOC
- No lintinues
- Technical debt at class C. Majorly because there are still some duplication in the GildedRose module and on the tests, an item to improve on.
