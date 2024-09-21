# XML (eXtensible Markup Language)

**XML** is a markup language designed to store and transport data. It focuses on the structure and organization of data, making it both human-readable and machine-readable.

## Key Features

1. **Self-descriptive**: XML documents are self-describing, with both data and structure clearly defined.

2. **Extensible**: Users can create custom tags, allowing for flexibility in data representation.

3. **Hierarchical Structure**: XML data is organized in a tree-like structure, making it easy to navigate and manipulate.

4. **Cross-platform**: XML is platform-independent, allowing data interchange between different systems and applications.

5. **Text-based**: Being text-based, XML is easy to read and edit, making it suitable for configuration files and data storage.

## Syntax Rules

- Elements must be properly nested and closed.
- Attribute values must be quoted.
- Tags are case-sensitive.
- XML documents must have a single root element.

## Example

Here’s a simple example of an XML document:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<person>
    <name>Alice</name>
    <age>30</age>
    <isStudent>false</isStudent>
    <courses>
        <course>Math</course>
        <course>Science</course>
    </courses>
</person>
