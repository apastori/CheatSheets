# JSON (JavaScript Object Notation)

**JSON** (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write and easy for machines to parse and generate. It is widely used for transmitting data between a server and a web application as an alternative to XML.

## Key Features

1. **Lightweight**: JSON is more compact than XML, making it efficient for data transmission.

2. **Text-based Format**: Being text-based, JSON is easy to read and write for humans, making it a popular choice for configuration files and data storage.

3. **Language Independent**: Although it is based on JavaScript syntax, JSON is language-independent and can be used with most programming languages, including Python, Java, C#, and more.

4. **Data Structures**: JSON supports the following basic data structures:
   - **Objects**: Unordered collections of key-value pairs enclosed in curly braces `{}`.
   - **Arrays**: Ordered lists of values enclosed in square brackets `[]`.

5. **Data Types**: JSON supports several data types:
   - Strings (enclosed in double quotes)
   - Numbers
   - Booleans (`true` or `false`)
   - Null
   - Objects
   - Arrays

## Example

Here’s a simple example of a JSON object:

```json
{
  "name": "Alice",
  "age": 30,
  "isStudent": false,
  "courses": ["Math", "Science"],
  "address": {
    "street": "123 Main St",
    "city": "Wonderland"
  }
}
