Cuis-Smalltalk-UniCodePoint-Properties
============

```Smalltalk
Feature require: #'System-Text-UnicodeSupport'.
```

Now that we have Unicode string handling and display in Cuis,
there may be a need for Unicode codepoint properties
to support processing.

World script systems have many kinds of spaces and punctuation,
some characters are upper or lower case, and so forth.

Unicode codepoint property description tables are fairly large
and may be unused, so we don't want them around all the time,
hence the 'System-Text-UnicodeSupport' package.

At present this package supplies a utility class named _UniCode_ which
supplies various utility methods.  These methods typically take a _Character_
or a _UnicodeCodePoint_.

E.g.
```Smalltalk
  UniCode isSpace: (UnicodeCodePoint codePoint: 32).
  UniCode rangeInfo: (UnicodeCodePoint codePoint: 16r2E80).
```

I hope to add a separate package here for Unicode Ropes.  We shall see..

