'From Cuis 6.0 [latest update: #5166] on 15 May 2022 at 2:47:18 pm'!
'Description Unicode Codepoint property tests use large tables which are not needed otherwise.
The UniCode class is a separately loaded utility class which provides access to these properties for those who need tham.'!
!provides: 'System-Text-UnicodeSupport' 1 9!
SystemOrganization addCategory: 'System-Text-UnicodeSupport'!


!classDefinition: #UniCode category: 'System-Text-UnicodeSupport'!
Object subclass: #UniCode
	instanceVariableNames: ''
	classVariableNames: 'AI AL B2 BA BB BK CB CJ CL CM CP CR CasedLetterBit Cc Cf Cn Co Compositions ControlBit Cs DecimalProperty Decompositions DefaultBreakChar EX GL GeneralCategory GeneralPropMask H2 H3 HL HY ID IN IS JL JT JV L LF LV LVT LVTStateMap LVTStateVec LetterBit LineBreakNames LineBreakProperties LineBreakTable LineBreakTypeNames Ll Lm Lo Lt Lu MarkBit Mc Me Mn NL NS NU Nd Nl No NumberBit OP PO PR Pc Pd Pe Pf Pi Po PropertyNames Ps PunctuationBit QU RI SA SG SP SY Sc SeparatorBit Sk Sm SmalltalkSpecialChars So SymbolBit T ToCasefold ToLower ToUpper V WJ XX ZW ZeroCodePoints Zl Zp Zs'
	poolDictionaries: ''
	category: 'System-Text-UnicodeSupport'!
!classDefinition: 'UniCode class' category: 'System-Text-UnicodeSupport'!
UniCode class
	instanceVariableNames: ''!


!UniCode commentStamp: '<historical>' prior: 0!
UnicodeCodePoints have properties which are supplied by me.

Not everyone needs this extra data, but you can load me with the package #'System-Text-UnicodeSupport'.

In general, my methods take 
	a Character, 
	a UnicodeCodePoint, 
	or an Integer in the range 0..16rFFFFFFFF (Unicode 32 bits)
!

!UniCode methodsFor: 'look in class' stamp: 'KenD 5/15/2022 08:28:52'!
seeClassSide
	"I have no instances.
	 All the methods for UniCode are class methods."! !

!UniCode class methodsFor: 'accessing' stamp: 'KenD 5/15/2022 10:47:29'!
lineBreakCategoryFor: charOrCodePt

	"Answer name of category code"
	| indexCode |
	indexCode :=  self lineBreakCategoryCodeFor: charOrCodePt.
	(indexCode isZero)
	ifTrue: [ ^ #Unknown ]
	ifFalse: [ ^ LineBreakProperties at: indexCode ]! !

!UniCode class methodsFor: 'accessing' stamp: 'KenD 5/15/2022 13:03:40'!
rangeInfo: charOrCodePt
	"Answer something about me: #( Category BlockName )"
	| codePoint |
	codePoint := charOrCodePt value.

(codePoint  between: 16r0000 and: 16r007F) ifTrue: [ ^ #( 'Latin 1' 'Basic Latin' )].
(codePoint  between: 16r0080 and: 16r00FF) ifTrue: [ ^ #( 'Latin 1' 'Latin-1 Supplement' )].

(codePoint between: 16r0100 and: 16r017F) ifTrue: [ ^ #( 'Latin Extended 1' 'Latin Extended-A' )].
(codePoint between: 16r0180 and: 16r024F) ifTrue: [ ^ #( 'Latin Extended 1' 'Latin Extended-B' )].
(codePoint between: 16r0250 and: 16r02AF) ifTrue: [ ^ #( 'Latin Extended 1' 'IPA Extensions' )].

(codePoint between: 16r02B0 and: 16r02FF) ifTrue: [ ^ #( 'Modifiers' 'Spacing Modifier Letters' )].
(codePoint between: 16r0300 and: 16r036F) ifTrue: [ ^ #( 'Modifiers' 'Combining Diacritical Marks' )].

(codePoint between: 16r0370 and: 16r03FF) ifTrue: [ ^ #( 'European Alphabetic 1' 'Greek and Coptic' )].
(codePoint between: 16r0400 and: 16r04FF) ifTrue: [ ^ #( 'European Alphabetic 1' 'Cyrillic' )].
(codePoint between: 16r0500 and: 16r052F) ifTrue: [ ^ #( 'European Alphabetic 1' 'Cyrillic Supplementary' )].
(codePoint between: 16r0530 and: 16r058F) ifTrue: [ ^ #( 'European Alphabetic 1' 'Armenian' )].

 ^ self rangeInfo2: charOrCodePt "too many literals for 1 method"! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 12:22:47'!
arrowDown

	^ (UnicodeCodePoint codePoint: 31)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:25:56'!
arrowLeft

	^ (UnicodeCodePoint codePoint: 28)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:27:21'!
arrowRight

	^ (UnicodeCodePoint codePoint: 29)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:27:40'!
arrowUp

	^ (UnicodeCodePoint codePoint: 30)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:35:52'!
home

	^ (UnicodeCodePoint codePoint: 1)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:35:30'!
insert

	^ (UnicodeCodePoint codePoint: 5)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:33:26'!
lfCharacter
	
	^ (UnicodeCodePoint codePoint: 10)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:34:35'!
lineSeparator
	"Answer Unicode LS"
	
	^ (UnicodeCodePoint codePoint: 2028)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:33:58'!
nbsp
	"non-breakable space."
	
	^ (UnicodeCodePoint codePoint: 202)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:33:15'!
newLineCharacter
	"Answer the Character representing a newLine, that is, a linefeed."
	
	^ self newLineCharacter ! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:30:48'!
newPage
	"Answer the Character representing a form feed."

	^ (UnicodeCodePoint codePoint: 12)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:30:15'!
null
	"Answer the null Character."

	^ (UnicodeCodePoint codePoint: 8)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:29:51'!
pageDown

	^ (UnicodeCodePoint codePoint: 12)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:29:21'!
pageUp

	^ (UnicodeCodePoint codePoint: 11)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:26:55'!
paragraphSeparator
	"Answer Unicode PS"

	^ (UnicodeCodePoint codePoint: 2029)! !

!UniCode class methodsFor: 'accessing untypable' stamp: 'KenD 5/14/2022 14:28:54'!
space
	"Answer the UnicodeCodePoint representing a tab."

	^ (UnicodeCodePoint codePoint: 9)! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:04:31'!
initZeroCodePoints
	"Script digit ranges starting at zero"

	ZeroCodePoints := #(
       16r0030                "DIGIT ZERO"
       16r0660                "ARABIC-INDIC DIGIT ZERO"
       16r06F0                "EXTENDED ARABIC-INDIC DIGIT ZERO"
       16r07C0                "NKO DIGIT ZERO"
       16r0966                "DEVANAGARI DIGIT ZERO"
       16r09E6                "BENGALI DIGIT ZERO"
       16r0A66                "GURMUKHI DIGIT ZERO"
       16r0AE6                "GUJARATI DIGIT ZERO"
       16r0B66                "ORIYA DIGIT ZERO"
       16r0BE6                "TAMIL DIGIT ZERO"
       16r0C66                "TELUGU DIGIT ZERO"
       16r0CE6                "KANNADA DIGIT ZERO"
       16r0D66                "MALAYALAM DIGIT ZERO"
       16r0E50                "THAI DIGIT ZERO"
       16r0ED0                "LAO DIGIT ZERO"
       16r0F20                "TIBETAN DIGIT ZERO"
       16r1040                "MYANMAR DIGIT ZERO"
       16r1090                "MYANMAR SHAN DIGIT ZERO"
       16r17E0                "KHMER DIGIT ZERO"
       16r1810                "MONGOLIAN DIGIT ZERO"
       16r1946                "LIMBU DIGIT ZERO"
       16r19D0                "NEW TAI LUE DIGIT ZERO"
       16r1A80                "TAI THAM HORA DIGIT ZERO"
       16r1A90                "TAI THAM THAM DIGIT ZERO"
       16r1B50                "BALINESE DIGIT ZERO"
       16r1BB0                "SUNDANESE DIGIT ZERO"
       16r1C40                "LEPCHA DIGIT ZERO"
       16r1C50                "OL CHIKI DIGIT ZERO"
       16rA620                "VAI DIGIT ZERO"
       16rA8D0                "SAURASHTRA DIGIT ZERO"
       16rA900                "KAYAH LI DIGIT ZERO"
       16rA9D0                "JAVANESE DIGIT ZERO"
       16rAA50                "CHAM DIGIT ZERO"
       16rABF0                "MEETEI MAYEK DIGIT ZERO"
       16rFF10                "FULLWIDTH DIGIT ZERO"
       16r104A0               "OSMANYA DIGIT ZERO"
       16r11066               "BRAHMI DIGIT ZERO"
       16r1D7CE               "MATHEMATICAL BOLD DIGIT ZERO"
       16r1D7D8               "MATHEMATICAL DOUBLE-STRUCK DIGIT ZERO"
       16r1D7E2               "MATHEMATICAL SANS-SERIF DIGIT ZERO"
       16r1D7EC               "MATHEMATICAL SANS-SERIF BOLD DIGIT ZERO"
       16r1D7F6               "MATHEMATICAL MONOSPACE DIGIT ZERO"
  ).
! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:29:51'!
initialize
"
	UniCode initialize.
"
	SmalltalkSpecialChars := Utf8String fromUtf8: '+-/\*~<>=@,%|&?!!'.
 	"Use EJECT char to show (char|word|line) break"
	DefaultBreakChar := (UnicodeCodePoint codePoint: 16r23CF). 
	self initZeroCodePoints.
	self initializeGeneralPropertyEnums.
	self initializeGeneralCharacterProperties.
	self initializeCaseMappings. 
	self initializeLineBreakProperties. "Must follow initializeGeneralCharacterProperties"
	self initializeLineBreakTable.
	self initializeHangulJamoLVT.
	! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:05:35'!
initializeCaseMappings
"
	UniCode initializeCaseMappings
" 	
  	ToCasefold 	:= IdentityDictionary new.
	ToUpper 		:= IdentityDictionary new.
	ToLower 		:= IdentityDictionary new.
	
  	(self package fullFileName asFileEntry parent pathName, '/', 'CaseFolding.txt') asFileEntry 
		readStreamDo: [ :fileStream |
			self parseCaseMappingFrom: fileStream ].
"
@@FIXME: download using ProgressBarMorph

	UIManager default informUserDuring: [:bar|
		| stream |
		bar value: 'Downloading Unicode data'.
		stream := HTTPClient httpGet: 'http://www.unicode.org/Public/UNIDATA/CaseFolding.txt'.
		(stream isKindOf: RWBinaryOrTextStream) ifFalse:[^self error: 'Download failed'].
		stream reset.
		bar value: 'Updating Case Mappings'.
		self parseCaseMappingFrom: stream.
	]
".! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:07:24'!
initializeGeneralCharacterProperties

  	(self package fullFileName asFileEntry parent pathName, '/', 'UnicodeData.txt') asFileEntry 
		readStreamDo: [ :fileStream |
			self parseGeneralPropertiesFrom: fileStream ].

	"@@FIXME: Download from  http://unicode.org/Public/UNIDATA/UnicodeData.txt "! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:07:17'!
initializeGeneralPropertyEnums

	"16 Bits for general properties.  Upper 8 is Category"
	CasedLetterBit 	:= 1<<15.
	LetterBit 			:= 1<<14.
	MarkBit 			:= 1<<13.
	NumberBit 		:= 1<<12.
	PunctuationBit 	:= 1<<11.
	SymbolBit 			:= 1<<10 .
	SeparatorBit 		:= 1<<09.
	ControlBit 			:= 1<<08.
	
	"Lower 8 bits have value"

"	CasedLetter := Lu + Ll +  Lt.
	Letter 		:= Lu + Ll + Lt + Lm + Lo.
	Mark 		:= Mn + Mc + Me.
	Number 	:= Nd + Nl + No.
	Punctuation 	:= Pc + Pd + Ps + Pe + Pi + Pf + Po.
	Symbol 		:= Sm + Sc + Sk + So .
	Separator 	:= Zs + Zl + Zp.
	Control 		:= Cc + Cf + Cs + Co + Cn.
"
	Cn 	:= ControlBit.
 	Cc 	:= ControlBit + 1.
 	Cf 	:= ControlBit + 2.
 	Co 	:= ControlBit + 3.
 	Cs 	:= ControlBit + 4.
 	Ll 		:= CasedLetterBit + LetterBit + 1.
 	Lm 	:= LetterBit + 2.
 	Lo 	:= LetterBit + 3.
 	Lt 		:= CasedLetterBit + LetterBit + 4.
 	Lu 	:= CasedLetterBit + LetterBit + 5.
 	Mc 	:= MarkBit + 1.
 	Me 	:= MarkBit + 2.
 	Mn 	:= MarkBit + 3.
 	Nd 	:= NumberBit + 1.
 	Nl 		:= NumberBit + 2.
 	No 	:= NumberBit + 3.
 	Pc 	:= PunctuationBit + 1.
 	Pd 	:= PunctuationBit + 2.
 	Pe 	:= PunctuationBit + 3.
 	Pf 		:= PunctuationBit + 4.
 	Pi 		:= PunctuationBit + 5.
 	Po 	:= PunctuationBit + 6.
 	Ps 	:= PunctuationBit + 7.
 	Sc 	:= SymbolBit + 1.
 	Sk 	:= SymbolBit + 2.
 	Sm 	:= SymbolBit + 3.
 	So 	:= SymbolBit + 4.
 	Zl 		:= SeparatorBit + 1.
 	Zp 	:= SeparatorBit + 2.
 	Zs 	:= SeparatorBit + 3.

	
	PropertyNames := Dictionary new: 30.
	PropertyNames at: Cn 	put: #Unassigned.
	PropertyNames at: Cc 	put: #Control.
 	PropertyNames at: Cf 	put: #Format.
 	PropertyNames at: Co 	put: #PrivateUse.
 	PropertyNames at: Cs 	put: #Surrogate.
 	PropertyNames at: Ll 	put: #LowercaseLetter .
 	PropertyNames at: Lm 	put: #ModifierLetter.
 	PropertyNames at: Lo 	put: #OtherLetter.
 	PropertyNames at: Lt 	put: #TitlecaseLetter..
 	PropertyNames at: Lu 	put: #UppercaseLetter .
 	PropertyNames at: Mc 	put: #SpacingMark..
 	PropertyNames at: Me 	put: #EnclosingMark.
 	PropertyNames at: Mn 	put: #NonspacingMark.
 	PropertyNames at: Nd 	put: #DecimalNumber.
 	PropertyNames at: Nl 	put: #LetterNumber.
 	PropertyNames at: No 	put: #OtherNumber.
 	PropertyNames at: Pc 	put: #ConnectorPunctuation.
 	PropertyNames at: Pd 	put: #DashPunctuation.
 	PropertyNames at: Pe 	put: #ClosePunctuation.
 	PropertyNames at: Pf 	put: #FinalPunctuation.
 	PropertyNames at: Pi 	put: #InitialPunctuation.
 	PropertyNames at: Po 	put: #OtherPunctuation.
 	PropertyNames at: Ps 	put: #OpenPunctuation.
 	PropertyNames at: Sc 	put: #CurrencySymbol.
 	PropertyNames at: Sk 	put: #ModifierSymbol.
 	PropertyNames at: Sm 	put: #MathSymbol.
 	PropertyNames at: So 	put: #OtherSymbol.
 	PropertyNames at: Zl 	put: #LineSeparator.
 	PropertyNames at: Zp 	put: #ParagraphSeparator.
 	PropertyNames at: Zs 	put: #SpaceSeparator.
	! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/15/2022 12:40:02'!
initializeHangulJamoLVT
	"Used for UniString  Grapheme cluster scanning.'
	See UniCode>>nextLVTStateFromState:"
	
	"Note table 1c in  Unicode Annex #29: Unicode Text Segmentation"

	"Indices into Hangul Jamo Syllable LVT state table"
	L		:= 1.
	V	 	:= 2.
	LV		:= 3.
	LVT	:= 4.
	T 		:= 5.
	"State x Input -> NextState"
	LVTStateVec := Array new: 5.
	LVTStateVec at: L		put: {L. V. LV. LVT. T.}. "equals START"
	LVTStateVec at: V		put: {0. V.  0.    0.   T.}.
	LVTStateVec at: LV		put: {0. V.  0.    0.   T.}.
	LVTStateVec at: LVT	put: {0. 0.   0.    0.   T.}.
	LVTStateVec at: T		put: {0. 0.   0.    0.   T.}.
	" 0 ->Out == EXIT "

	LVTStateMap := Array new: (LineBreakProperties size) withAll: 0.
	LVTStateMap at: H2 put: LV.	
	LVTStateMap at: H3 put: LVT.
	LVTStateMap at: JL put: L.
	LVTStateMap at: JV put: V.
	LVTStateMap at: JT put: T.
! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:07:04'!
initializeLineBreakProperties
"
	UniChar initializeLineBreakProperties.
"
	"Values in byte 16r00FF0000"
	LineBreakProperties := Array new: 40.
	LineBreakTypeNames := #( BreakAfter DontbreakAfter 
									BreakBefore DontbreakBefore
									BreakForPair DontbreakForPair  ).
	AL := 1.
	LineBreakProperties at: AL put: #Alphabetic . "DontbreakForPair"
	B2 := 2.
	LineBreakProperties at: B2 put: #BeforeAndAfter . "BreakBefore | DontbreakForPair | BreakAfter"
	BA := 3.
	LineBreakProperties at: BA put: #BreakAfter . "BreakAfter"
	BB := 4.
	LineBreakProperties at: BB put: #BreakBefore . "BreakBefore"
	BK := 5.
	LineBreakProperties at: BK put: #MandatoryBreak . "BreakAfter"
	CB := 6.
	LineBreakProperties at: CB put: #ContingentBreak . "BreakBefore | BreakAfter"
	CL := 7.
	LineBreakProperties at: CL put: #ClosePunctuation . "DontbreakBefore"
	CP := 8.
	LineBreakProperties at: CP put: #CloseParenthesis . "DontbreakBefore"
	CM := 9.
	LineBreakProperties at: CM put: #CombiningMark . "DontbreakBefore"
	CR := 10.
	LineBreakProperties at: CR put: #CarrageReturn . "Always Break unless followed by LF"
	EX := 11.
	LineBreakProperties at: EX put: #ExclamationInterrogation . "DontbreakBefore"
	GL := 12.
	LineBreakProperties at: GL put: #Glue . "DontbreakBefore | DontbreakAfter"
	H2 := 13.
	LineBreakProperties at: H2 put: #HangulLV . "BreakBefore | BreakAfter"
	H3 := 14.
	LineBreakProperties at: H3 put: #HangulLVT . "BreakBefore | BreakAfter"
	HL := 15.
	LineBreakProperties at: HL put: #HebrewLetter . "DontbreakBefore"
	HY := 16.
	LineBreakProperties at: HY put: #Hyphen . "DontbreakBefore"
	ID := 17.
	LineBreakProperties at: ID put: #Ideographic . "BreakBefore | BreakAfter"
	IN := 18.
	LineBreakProperties at: IN put: #InseparableCharacters . "DontbreakForPair"
	IS := 19.
	LineBreakProperties at: IS put: #InfixNumericSeparator . "DontbreakBefore"
	JL := 20.
	LineBreakProperties at: JL put: #HangulLJamo . "BreakBefore"
	JT := 21.
	LineBreakProperties at: JT put: #HangulTJamo . "BreakAfter"
	JV := 22.
	LineBreakProperties at: JV put: #HangulVJamo . "DontbreakBefore | DontbreakAfter"
	LF := 23.
	LineBreakProperties at: LF put: #LineFeed . "Always Break unless followed by CR"
	NL := 24.
	LineBreakProperties at: NL put: #NextLine . "BreakAfter"
	NS := 25.
	LineBreakProperties at: NS put: #NonStarters . "DontbreakBefore"
	NU := 26.
	LineBreakProperties at: NU put: #Numeric . "DontbreakForPair"
	OP := 27.
	LineBreakProperties at: OP put: #OpenPunctuation . "DontbreakAfter"
	PO := 28.
	LineBreakProperties at: PO put: #PostfixNumeric . "DontbreakBefore"
	PR := 29.
	LineBreakProperties at: PR put: #PrefixNumeric . "DontbreakAfter"
	QU := 30.
	LineBreakProperties at: QU put: #Quotation . "DontbreakBefore | DontbreakAfter"
	SP := 31.
	LineBreakProperties at: SP put: #Space . "BreakAfter"
	SY := 32.
	LineBreakProperties at: SY put: #Symbols . "BreakAfter"
	WJ := 33.
	LineBreakProperties at: WJ put: #WordJoiner . "DontbreakBefore | DontbreakAfter"
	ZW := 34.
	LineBreakProperties at: ZW put: #ZeroWidthSpace . "BreakAfter"
	RI := 35.
	LineBreakProperties at: RI put: #RegionalIndicator . "BreakBefore | DontbreakForPair | BreakAfter"
	AI := 36.
	LineBreakProperties at: AI put: #AlphaOrIdeograph . "Ambiguous; treated the same"
	XX := 37.
	LineBreakProperties at: XX put: #Unassigned . "Who knows? Who cares?"
	SA := 38.
	LineBreakProperties at: SA put: #SoutheastAsian . "Complex Context Dependent"
	CJ := 39.
	LineBreakProperties at: CJ put: #ConditionalJapaneseStarted .

	SG := 40.
	LineBreakProperties at: SG put: #Surrogate . "DontbreakForPair"

	(self package fullFileName asFileEntry parent pathName, '/', 'LineBreak.txt')
		 asFileEntry readStreamDo: [ :fileStream |	
				self parseLineBreakPropertiesFrom: fileStream
		].

! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:06:56'!
initializeLineBreakTable
	"From  Unicode Standard Annex #14: Unicode Line Breaking Algorithm"

	LineBreakNames := IdentityDictionary new: 2.
	LineBreakNames at: $x put: #BreakProhibited.
	LineBreakNames at: $0 put: #BreakAllowed.

	LineBreakTable := Array new: 40.
	LineBreakTable at: AL put: '×0×0×0××××××00××0××000×××××00×××××0××××x'.
	LineBreakTable at: B2 put: '0××0×0××××××000×00×000×××0000×××××0000×x'.
	LineBreakTable at: BA put: '00×0×0×××××0000×00×000×××0000×××××0000×x'.
	LineBreakTable at: BB put: '×××××0×××××××××××××××××××××××××××××××××x'.
	LineBreakTable at: BK put: '000000000000000000000000000000000000000x'.
	LineBreakTable at: CB put: '0000×0××××××000000×000××00000×××××00000x'.
	LineBreakTable at: CL put: '00×0×0××××××000×00×000×××0000×××××0000×x'.
	LineBreakTable at: CP put: '×0×0×0××××××00××00×000××××000×××××0××××x'.
	LineBreakTable at: CM put: '×0×0×0××××××00××0××000×××××00×××××0××××x'.
	LineBreakTable at: CR put: '0000000000000000000000×0000000000000000x'.
	LineBreakTable at: EX put: '00×0×0××××××000×00×000×××0000×××××0000×x'.
	LineBreakTable at: GL put: '×××××××××××××××××××××××××××××××××××××××x'.
	LineBreakTable at: H2 put: '00×0×0××××××000×0××0×××××00×0×××××0000×x'.
	LineBreakTable at: H3 put: '00×0×0××××××000×0××0×0×××00×0×××××0000×x'.
	LineBreakTable at: HL put: '×0×0×0××××××00××0××000×××××00×××××0××××x'.
	LineBreakTable at: HY put: '00×0×0×××××0000×00×000××××000×××××0000×x'.
	LineBreakTable at: ID put: '00×0×0××××××000×0××000×××00×0×××××0000×x'.
	LineBreakTable at: IN put: '00×0×0××××××000×0××000×××0000×××××0000×x'.
	LineBreakTable at: IS put: '×0×0×0××××××00××00×000×××0000×××××0××××x'.
	LineBreakTable at: JL put: '00×0×0××××××××0×0×××0××××00×0×××××0000×x'.
	LineBreakTable at: JT put: '00×0×0××××××000×0××0×0×××00×0×××××0000×x'.
	LineBreakTable at: JV put: '00×0×0××××××000×0××0×××××00×0×××××0000×x'.
	LineBreakTable at: LF put: '000000000000000000000000000000000000000x'.
	LineBreakTable at: NL put: '000000000000000000000000000000000000000x'.
	LineBreakTable at: NS put: '00×0×0××××××000×00×000×××0000×××××0000×x'.
	LineBreakTable at: NU put: '×0×0×0××××××00××0××000××××××××××××0××××x'.
	LineBreakTable at: OP put: '×××××××××××××××××××××××××××××××××××××××x'.
	LineBreakTable at: PO put: '×0×0×0××××××00××00×000××××000×××××0××××x'.
	LineBreakTable at: PR put: '×0×0×0×××××××××××0××××××××000×××××0××××x'.
	LineBreakTable at: QU put: '×××××××××××××××××××××××××××××××××××××××x'.
	LineBreakTable at: SP put: '0000×0××0××0000000×000××000000××××00000x'.
	LineBreakTable at: SY put: '00×0×0××××××000×00×000×××0000×××××0000×x'.
	LineBreakTable at: WJ put: '×××××××××××××××××××××××××××××××××××××××x'.
	LineBreakTable at: ZW put: '0000×0000×000000000000××000000×00×00000x'.
	LineBreakTable at: RI put: '00×0×0××××××000×00×000×××0000××××××000×x'.
	LineBreakTable at: AI put: '×0×0×0××××××00××0××000×××××00×××××0××××x'.
	LineBreakTable at: XX put: '×0×0×0××××××00××0××000×××××00×××××0××××x'.
	LineBreakTable at: SA put: '×0×0×0××××××00××0××000×××××00×××××0××××x'.
	LineBreakTable at: CJ put: '00×0×0××××××000×00×000×××0000×××××0000×x'.
	LineBreakTable at: SG put: '×××××××××××××××××××××××××××××××××××××××'.
! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/15/2022 12:43:53'!
parseCaseMappingFrom: stream
	"Parse the Unicode casing mappings from the given stream.
	Handle only the simple mappings"
	"
		UniChar initializeCaseMappings.
	"
	|  toNumber |
	toNumber := [:quad | ('16r', quad) asNumber].
	
	ToCasefold 	:= IdentityDictionary new: 2048.
	ToUpper 		:= IdentityDictionary new: 2048.
	ToLower 		:= IdentityDictionary new: 2048.

	[stream atEnd] whileFalse:[
		| fields line srcCode dstCode |
		line := stream nextLine copyUpTo: $#.
		fields := line withBlanksTrimmed findTokens: $;.
		(fields size > 2 and: [#('C' 'S') includes: (fields at: 2) withBlanksTrimmed]) ifTrue:[
			srcCode := toNumber value:(fields at: 1) withBlanksTrimmed.
			dstCode := toNumber value: (fields at: 3) withBlanksTrimmed.
			ToCasefold at: srcCode put: dstCode.
		].
	].

	ToCasefold keysAndValuesDo:
		[:k :v |
		(self isUppercase: k)
			ifTrue:
				["In most cases, uppercase letter are folded to lower case"
				ToUpper at: v put: k.
				ToLower at: k put: v].
		(self isLowercase: k)
			ifTrue:
				["In a few cases, two lower case letters are folded to the same lower case.
				We must find an upper case letter folded to the same letter"
				| up |
				up := ToCasefold keys 
					detect: [:e | (self isUppercase: e) 
									and: [(ToCasefold at: e) = v]
					] 
					ifNone: [nil].
				up ifNotNil: [ToUpper at: k put: up]]].
! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:32:40'!
parseGeneralPropertiesFrom: aStream

	|  toNumber |
	toNumber := [:quad | ('16r', quad) asNumber].

	GeneralCategory := IdentityDictionary new: 24430.
	
	[aStream atEnd] whileFalse:[
		| fields line codePoint generalCategory  |
		line := aStream nextLine.
		fields := line withBlanksTrimmed findTokens: $;.
		(fields size > 3) ifTrue: [.
			codePoint := toNumber value: (fields at: 1).
			(UniCode isCJKIdeograph: codePoint) ifFalse: [ "add it"
				generalCategory := self perform: ((fields at: 3) asSymbol).
				GeneralCategory at: codePoint put: generalCategory
			]
		]
	].
! !

!UniCode class methodsFor: 'class initialization' stamp: 'KenD 5/14/2022 12:33:26'!
parseLineBreakPropertiesFrom: aStream

	|  toNumber  |
	toNumber := [:quad | ('16r', quad) asNumber].

	"GeneralCategory initialized before this is invoked"
	
	[aStream atEnd] whileFalse:[
		| fields line codePoint  lbCategory otherInfo |
		line := aStream nextLine copyUpTo: $#.
		fields := line withBlanksTrimmed findTokens: $; .
		(fields size > 1) ifTrue: [.
			codePoint := toNumber value: (fields at: 1).
			(UniCode isCJKIdeograph: codePoint) ifFalse: [ "add it"
				lbCategory := self perform: ((fields at: 2) asSymbol).
				(lbCategory isZero) ifFalse: [
					otherInfo := GeneralCategory at: codePoint ifAbsent: [ Cn ].
					GeneralCategory at: codePoint put: (otherInfo + (lbCategory bitShift: 16)).
				]
			]
		].
	].
! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:37:10'!
caseInsensiticeEqualBetween: left and: right

	^ (self caseFold: left) = (self caseFold: right)! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:36:58'!
caseInsensiticeGreaterBetween: left and: right

	^ (self caseFold: left) > (self caseFold: right)! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:36:41'!
caseInsensiticeGreaterOrEqualBetween: left and: right

	^ (self caseFold: left) >= (self caseFold: right)! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:33:16'!
caseInsensiticeLessBetween: left and: right

	^ (self caseFold: left) < (self caseFold: right)! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:36:25'!
caseInsensiticeLessOrEqualBetween: left and: right

	^ (self caseFold: left) <= (self caseFold: right)! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:31:33'!
equalBetween: left and: right

	^ left value = right value! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:31:22'!
greaterBetween: left and: right

	^ left value > right value! !

!UniCode class methodsFor: 'comparing' stamp: 'KenD 5/15/2022 12:31:10'!
lessBetween: left and: right

	^ left value < right value! !

!UniCode class methodsFor: 'converting' stamp: 'KenD 5/15/2022 08:09:33'!
asCharacter: charOrCodePt
	| code |
	code := charOrCodePt asInteger.
	(code value < 255)
	ifTrue: [ ^ code asCharacter ]
	ifFalse: [ DomainError 
				signal: 'Unicode code point out of range for ISO 8859-15' ]
! !

!UniCode class methodsFor: 'converting' stamp: 'KenD 5/15/2022 08:06:57'!
asInteger: charOrCodePt

	^ charOrCodePt value! !

!UniCode class methodsFor: 'converting' stamp: 'KenD 5/15/2022 08:06:27'!
asLowercase: charOrCodePt

	^self toLower: charOrCodePt! !

!UniCode class methodsFor: 'converting' stamp: 'KenD 5/15/2022 08:06:13'!
asUppercase: charOrCodePt

	^self toUpper: charOrCodePt! !

!UniCode class methodsFor: 'converting' stamp: 'KenD 5/15/2022 08:03:50'!
caseFold: charOrCodePt
	"Answer folded case or original"
	| codePt |
	codePt := ToCasefold 
					at: charOrCodePt value 
					ifAbsent: [ ^self ].
	^ UnicodeCodePoint codePoint: codePt! !

!UniCode class methodsFor: 'converting' stamp: 'KenD 5/15/2022 08:04:54'!
toLower: charOrCodePt
	"Answer lower case or original"
	| codePt |
	codePt := ToLower
					at: charOrCodePt value 
					ifAbsent: [ ^self ].
	^ UnicodeCodePoint codePoint: codePt! !

!UniCode class methodsFor: 'converting' stamp: 'KenD 5/15/2022 08:05:18'!
toUpper: charOrCodePt
	"Answer lower case or original"
	| codePt |
	codePt := ToUpper
					at: charOrCodePt value 
					ifAbsent: [ ^self ].
	^ UnicodeCodePoint codePoint: codePt! !

!UniCode class methodsFor: 'instance creation' stamp: 'KenD 5/14/2022 14:38:20'!
fromCharacter: aCharacter
	"We don't have instances; answer a UnicodeCodePoint"
	
	^ (UnicodeCodePoint codePoint: aCharacter value)! !

!UniCode class methodsFor: 'instance creation' stamp: 'KenD 5/14/2022 14:37:41'!
value: aNumber
	"We don't have instances; answer a UnicodeCodePoint"
	
	^ (UnicodeCodePoint codePoint: aNumber)! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 10:50:50'!
hasTagCombiningMark: charOrCodePt

	^ (self lineBreakCategoryCodeFor: charOrCodePt) = CM! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 10:54:45'!
hasTagConnectorPunctuation: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = CP! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 10:55:10'!
hasTagControl: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Cc! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 10:55:32'!
hasTagDecimalNumber: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Nd! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 10:55:58'!
hasTagEnclosingMark: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Me! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 10:56:24'!
hasTagFormat: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Cf! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:00:20'!
hasTagGlue: charOrCodePt

	^ (self lineBreakCategoryCodeFor: charOrCodePt) = GL! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:03:07'!
hasTagInLVT: charOrCodePt
	"Hangul Jamo
		JL -> L     Leading
		JV -> V    Vowel
		JT -> T    Trailing
		H2 ->  LV    Syllable
	"
	^ { H2. H3. JL. JV. JT. } 
		includes: (self lineBreakCategoryCodeFor: charOrCodePt)! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:03:41'!
hasTagLineSeparator: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Zl! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:04:17'!
hasTagLowercase: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Ll! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:04:43'!
hasTagNonspacingMark: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Mn! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:06:22'!
hasTagOtherNumber: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = No! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:06:10'!
hasTagParagraphSeparator: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Zp! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:06:44'!
hasTagSpaceSeparator: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Zs! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:07:08'!
hasTagSpacingMark: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Mc! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:07:31'!
hasTagSurrogate: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Cs! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:07:53'!
hasTagTitlecase: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Lt! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:08:12'!
hasTagUppercase: charOrCodePt

	^ (self generalCategoryCodeFor: charOrCodePt) = Lu! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 11:09:01'!
hasTagWordALetter: charOrCodePt
	"Word Property"

	^ self isLetter! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 12:57:02'!
hasTagWordExtend: charOrCodePt
	"Word Property"
	| generalCode |
	generalCode := self generalCategoryCodeFor: charOrCodePt.
	^ (generalCode = Mn) or: [generalCode = Mc]! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 12:57:49'!
hasTagWordExtendedNumLet: charOrCodePt
	"Word Property.  Nota Bene: Not  CR | LF"

   ^ #(	16r005F.     " LOW LINE"
		16r203F.	"UNDERTIE..CHARACTER TIE"
		16r2040.	 "UNDERTIE..CHARACTER TIE"
		16r2054.	" INVERTED UNDERTIE"
		16rFE33.	"PRESENTATION FORM FOR VERTICAL LOW LINE"
		16rFE34.   "PRESENTATION FORM FOR VERTICAL WAVY LOW LINE"
		16rFE4D. 16rFE4E.	 "DASHED LOW LINE"
		16rFE4F.	"WAVY LOW LINE"
		16rFF3F.	"FULLWIDTH LOW LINE"
	) includes: charOrCodePt value
! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 12:58:36'!
hasTagWordFormat: charOrCodePt
	"Word Property"
	
	^ (self generalCategoryCodeFor: charOrCodePt) = Cf! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 13:00:11'!
hasTagWordKatakana: charOrCodePt
	"Word Property"
	| codePoint |
	codePoint := charOrCodePt value.
	"@@FIXME: use a faster lookup/test"
	( #( 16r309B. 16r309C. 16r30A0. 
		16r30FC. 16r30FD. 16r30FE.
		16r30FF. 16rFF70. 16r1B000. ) includes: codePoint)
	ifTrue: [ ^true ].

	((16r3031 to: 16r3035) includes: codePoint) ifTrue: [ ^true ].
	((16r30A1 to: 16r30FA) includes: codePoint) ifTrue: [ ^true ].
	((16r31F0 to: 16r31FF) includes: codePoint) ifTrue: [ ^true ].
	((16r32D0 to: 16r32FE) includes: codePoint) ifTrue: [ ^true ].
	((16r3300 to: 16r3357) includes: codePoint) ifTrue: [ ^true ].
	((16rFF66 to: 16rFF6F) includes: codePoint) ifTrue: [ ^true ].
	((16rFF71 to: 16rFF9D) includes: codePoint) ifTrue: [ ^true ].

	^false! !

!UniCode class methodsFor: 'properties' stamp: 'KenD 5/15/2022 13:00:59'!
hasTagWordMinLetter: charOrCodePt
	"Word Property"

   ^ #(	16r003A.	"COLON"
		16r00B7.	"MIDDLE DOT"
		16r0387.	"GREEK ANO TELEIA"
		16r05F4.	"HEBREW PUNCTUATION GERSHAYIM"
		16r2027.	"HYPHENATION POINT"
		16rFE13.	"PRESENTATION FORM FOR VERTICAL COLON"
		16rFE55.	"SMALL COLON"
		16rFF1A.	"FULLWIDTH COLON"
	) includes: charOrCodePt value! !

!UniCode class methodsFor: 'streams' stamp: 'KenD 5/14/2022 12:11:00'!
nextUniCharFromUtf8: anUtf8Stream
	"anUtf8Stream can be over a ByteArray
	Answer nil if conversion not possible, because of invalid UTF-8.
	Also answer nil for codePoint U+FEFF (BOM, unneededly added by Win clipboard)"

	| byte1 byte2 byte3 byte4 codePoint |
	byte1 := anUtf8Stream next asInteger.
	byte1 < 128 ifTrue: [ ^ byte1 asUniChar ]. "single byte"
	
	"At least 2 bytes"
	byte2 := anUtf8Stream next asInteger.
	(byte2 bitAnd: 16rC0) = 16r80 ifFalse: [^nil]. "invalid UTF-8"
	
	(byte1 bitAnd: 16rE0) = 192 ifTrue: [ "two bytes"
		codePoint :=  (((byte1 bitAnd: 31) bitShift: 6) 
					 + (byte2 bitAnd: 63)).
		^ codePoint asUniChar
	].
	
	"At least 3 bytes"
	byte3 := anUtf8Stream next asInteger.
	(byte3 bitAnd: 16rC0) = 16r80 ifFalse: [^nil]. "invalid UTF-8"
	
	(byte1 bitAnd: 16rF0) = 224 ifTrue: [ "three bytes"
		codePoint :=  ((byte1 bitAnd: 15) bitShift: 12) 
					+ ((byte2 bitAnd: 63) bitShift: 6) 
					+ (byte3 bitAnd: 63).
		^ codePoint asUniChar
	].

	"4 bytes"
	byte4 := anUtf8Stream next asInteger.
	(byte4 bitAnd: 16rC0) = 16r80 ifFalse: [^nil]. "invalid UTF-8"
	
	(byte1 bitAnd: 16rF8) = 240 ifTrue: [  "four bytes"
		codePoint :=  ((byte1 bitAnd: 16r7) bitShift: 18) 
					+ ((byte2 bitAnd: 63)   bitShift: 12) 
					+ ((byte3 bitAnd: 63)   bitShift:   6) 
					+ (byte4 bitAnd: 63).
		^ codePoint asUniChar
	].

	^nil! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/14/2022 12:34:54'!
isCJKIdeograph: codePoint

	(codePoint between: 16r2E80 and: 16r303F) ifTrue: [ ^true ]. "CJK Ideographic"
	(codePoint between:16r3300 and: 16rA4CF) ifTrue: [ ^true ]. "CJK Compatibility + Extensions A+"
	(codePoint between: 16rF900 and: 16rFAFF) ifTrue: [ ^true ].
	(codePoint between: 16rFE30 and: 16rFE4F) ifTrue: [ ^ true ].  "CJK Compatibility Forms"
	(codePoint between:16r20000 and: 16r2A6DF) ifTrue: [ ^true ].  "CJK Unified Ideographs Extension B"
	(codePoint between:16r2A700 and: 16r2B81F) ifTrue: [ ^true ]. "CJK Unified Ideographs Extension C +  D"
	(codePoint between:16r2F800 and: 16r2FA1F) ifTrue: [ ^true ]. "CJK Compatibility Ideographs Supplement"
	
	^ false! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/14/2022 14:24:39'!
isCR: char

	^ char value = 16r000D! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/14/2022 12:08:42'!
isCharBreakBetween: leftChar and:  rightChar
	"Answer true if a Character break is allowed between the two characters.
	
	This is required because Combining Marks and other codePoints 
	must be combined into a single display character."

	^ ((LineBreakTable at: (leftChar lineBreakCategoryCode)) "@@FIXME: Bogus!!!!@@"
						   at: (rightChar lineBreakCategoryCode)) = $0! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/14/2022 14:42:39'!
isLF: charOrCodePt

	^ charOrCodePt value = 16r000A! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 10:37:24'!
isLeftBracket: charOrCodePt
	"Answer Unicode 'Ps' (Punctuation Start) with LEFT & BRACKET in description"
	
	"ASCII:  ^ self codePoint =  $[ codePoint"
	^
	#(
	16r005B "LEFT SQUARE BRACKET ["
	16r007B "LEFT CURLY BRACKET {"
	16r2045 "LEFT SQUARE BRACKET WITH QUILL &#8261;"
	16r2329 "LEFT-POINTING ANGLE BRACKET &#12296;"
	16r276C "MEDIUM LEFT-POINTING ANGLE BRACKET ORNAMENT &#10092;"
	16r276C "MEDIUM LEFT-POINTING ANGLE BRACKET ORNAMENT &#10092;"
	16r2770 "HEAVY LEFT-POINTING ANGLE BRACKET ORNAMENT &#10096;"
	16r2772 "LIGHT LEFT TORTOISE SHELL BRACKET ORNAMENT &#10098;"
	16r2774 "MEDIUM LEFT CURLY BRACKET ORNAMENT &#10100;"
	16r27e6 "MATHEMATICAL LEFT WHITE SQUARE BRACKET &#10214;"
	16r27e8 "MATHEMATICAL LEFT ANGLE BRACKET &#10216;"
	16r27EA "MATHEMATICAL LEFT DOUBLE ANGLE BRACKET &#10218;"
	16r27EC "MATHEMATICAL LEFT WHITE TORTOISE SHELL BRACKET &#10220;"
	16r2983 "LEFT WHITE CURLY BRACKET &#10627;"
	16r2987 "Z NOTATION LEFT IMAGE BRACKET &#10631;"
	16r2989 "Z NOTATION LEFT BINDING BRACKET &#10633;"
	16r298B "LEFT SQUARE BRACKET WITH UNDERBAR &#10635;"
	16r298D "LEFT SQUARE BRACKET WITH TICK IN TOP CORNER &#10637;"
	16r298F "LEFT SQUARE BRACKET WITH TICK IN BOTTOM CORNER &#10639;"
	16r2991 "LEFT ANGLE BRACKET WITH DOT &#10641;"
	16r2993 "LEFT ARC LESS-THAN BRACKET &#10643;"
	16r2995 "DOUBLE LEFT ARC GREATER-THAN BRACKET &#10645;"
	16r2997 "LEFT BLACK TORTOISE SHELL BRACKET &#10647;"
	16r29FC "LEFT-POINTING CURVED ANGLE BRACKET &#10748;"
	16r2e22 "TOP LEFT HALF BRACKET &#11810;"
	16r2e24 "BOTTOM LEFT HALF BRACKET &#11812;"
	16r2e26 "LEFT SIDEWAYS U BRACKET &#11814;"
	16r3008 "LEFT ANGLE BRACKET &#12296;"
	16r300A "LEFT DOUBLE ANGLE BRACKET &#12298;"
	16r300C "LEFT CORNER BRACKET &#12300;"
	16r300E "LEFT WHITE CORNER BRACKET &#12302;"
	16r3010 "LEFT BLACK LENTICULAR BRACKET &#12304;"
	16r3014 "LEFT TORTOISE SHELL BRACKET &#12308;"
	16r3016 "LEFT WHITE LENTICULAR BRACKET &#12310;"
	16r3018 "LEFT WHITE TORTOISE SHELL BRACKET &#12312;"
	16r301A "LEFT WHITE SQUARE BRACKET &#12314;"
	16rFE17 "PRESENTATION FORM FOR VERTICAL LEFT WHITE LENTICULAR BRACKET &#65047;"
	16rFE37 "PRESENTATION FORM FOR VERTICAL LEFT CURLY BRACKET &#65079;"
	16rFE39 "PRESENTATION FORM FOR VERTICAL LEFT TORTOISE SHELL BRACKET &#65081;"
	16rFE3B "PRESENTATION FORM FOR VERTICAL LEFT BLACK LENTICULAR BRACKET &#65083;"
	16rFE3D "PRESENTATION FORM FOR VERTICAL LEFT DOUBLE ANGLE BRACKET &#65085;"
	16rFE3F "PRESENTATION FORM FOR VERTICAL LEFT ANGLE BRACKET &#65087;"
	16rFE41 "PRESENTATION FORM FOR VERTICAL LEFT CORNER BRACKET &#65089;"
	16rFE43 "PRESENTATION FORM FOR VERTICAL LEFT WHITE CORNER BRACKET &#65091;"
	16rFE47 "PRESENTATION FORM FOR VERTICAL LEFT SQUARE BRACKET &#65095;"
	16rFE5B "SMALL LEFT CURLY BRACKET &#65115;"
	16rFE5D "SMALL LEFT TORTOISE SHELL BRACKET &#65117;"
	16rFF3B "FULLWIDTH LEFT SQUARE BRACKET &#65339;"
	16rFF5B "FULLWIDTH LEFT CURLY BRACKET &#65371;"
	16rFF62 "HALFWIDTH LEFT CORNER BRACKET &#65378;"
	) includes: charOrCodePt value
! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 11:10:52'!
isLetter: charOrCodePt

	^ (((self generalCategoryCodeFor: charOrCodePt) bitAnd: LetterBit)
		 = LetterBit)! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/14/2022 14:11:08'!
isLineBreakBetween: leftChar and:  rightChar
	"Answer true if a line break is allowed between the two characters."

	"See comments in UniCode class>>initializeLineBreakTable"
	^ ((LineBreakTable at: (leftChar lineBreakCategoryCode))
						   at: (rightChar lineBreakCategoryCode)) = $0! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 11:13:18'!
isLineSeparator: charOrCodePt
	"Answer true if Unicode Line Separator OR Smalltalk Line Separator"
	"Distinguish: isSeparator"
	"Character newLineCharacter asUniChar isLineSeparator."
	| numericValue |
	numericValue := charOrCodePt value.
	^ (  "Unicode:  NextLine, LineSeparator, ParagraphSeparator"
 		#( 16r0085 16r2028 16r2029 ) includes: numericValue)
		     "Smalltalk:  LineFeed CarriageReturn FormFeed"
		 	or: [(numericValue < 16rFF) 
					and: [numericValue asCharacter isLineSeparator]] ! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 11:13:51'!
isLowercase: charOrCodePt

	^ self hasTagLowercase: charOrCodePt! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 11:14:32'!
isMark: charOrCodePt

	^ (((self generalCategoryCodeFor: charOrCodePt) bitAnd: MarkBit) 
			= MarkBit)! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 11:15:12'!
isNumberChar: charOrCodePt

	^ (((self generalCategoryCodeFor: charOrCodePt) bitAnd: NumberBit) 
			= NumberBit)! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 11:15:36'!
isOtherControl: charOrCodePt

	^ (((self generalCategoryCodeFor: charOrCodePt) bitAnd: ControlBit) 
			= ControlBit)! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 12:20:00'!
isPunctuation: charOrCodePt

	^ (((self generalCategoryCodeFor: charOrCodePt) bitAnd: PunctuationBit) 
			= PunctuationBit)! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 12:20:40'!
isRegionalIndicator: charOrCodePt

	^ charOrCodePt between: 16r1F1E6 and: 16r1F1FF! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 12:22:08'!
isRightBracket: charOrCodePt
	"Answer Unicode 'Pe' (Punctuation End) with RIGHT & BRACKET in description"
	
	"ASCII:  ^ self codePoint =  $] codePoint"
	^
	#( 
	16r005D	"RIGHT SQUARE BRACKET	]"
	16r007D	"RIGHT CURLY BRACKET	}"
	16r2046	"RIGHT SQUARE BRACKET WITH QUILL	&#8262;"
	16r232A	"RIGHT-POINTING ANGLE BRACKET	&#9002;"
	16r276D	"MEDIUM RIGHT-POINTING ANGLE BRACKET ORNAMENT	&#10093;"
	16r2771	"HEAVY RIGHT-POINTING ANGLE BRACKET ORNAMENT	&#10097;"
	16r2773	"LIGHT RIGHT TORTOISE SHELL BRACKET ORNAMENT	&#10099;"
	16r2775	"MEDIUM RIGHT CURLY BRACKET ORNAMENT	&#10101;"
	16r27E7	"MATHEMATICAL RIGHT WHITE SQUARE BRACKET	&#10215;"
	16r27E9	"MATHEMATICAL RIGHT ANGLE BRACKET	&#10217;"
	16r27EB	"MATHEMATICAL RIGHT DOUBLE ANGLE BRACKET	&#10219;"
	16r27ED	"MATHEMATICAL RIGHT WHITE TORTOISE SHELL BRACKET	&#10221;"
	16r2984	"RIGHT WHITE CURLY BRACKET	&#10628;"
	16r2988	"Z NOTATION RIGHT IMAGE BRACKET	&#10632;"
	16r298A	"Z NOTATION RIGHT BINDING BRACKET	&#10634;"
	16r298C	"RIGHT SQUARE BRACKET WITH UNDERBAR	&#10636;"
	16r298E	"RIGHT SQUARE BRACKET WITH TICK IN BOTTOM CORNER	&#10638;"
	16r2990	"RIGHT SQUARE BRACKET WITH TICK IN TOP CORNER	&#10640;"
	16r2992	"RIGHT ANGLE BRACKET WITH DOT	&#10642;"
	16r2994	"RIGHT ARC GREATER-THAN BRACKET	&#10644;"
	16r2996	 "DOUBLE RIGHT ARC LESS-THAN BRACKET	&#10646;"
	16r2998	"RIGHT BLACK TORTOISE SHELL BRACKET	&#10648;"
	16r29FD	"RIGHT-POINTING CURVED ANGLE BRACKET	&#10749;"
	16r2E23	"TOP RIGHT HALF BRACKET	&#11811;"
	16r2E25	"BOTTOM RIGHT HALF BRACKET	&#11813;"
	16r2E27	"RIGHT SIDEWAYS U BRACKET	&#11815;"
	16r3009	"RIGHT ANGLE BRACKET	&#12297;"
	16r300B	"RIGHT DOUBLE ANGLE BRACKET	&#12299;"
	16r300D	"RIGHT CORNER BRACKET	&#12301;"
	16r300F	"RIGHT WHITE CORNER BRACKET	&#12303;"
	16r3011	"RIGHT BLACK LENTICULAR BRACKET	&#12305;"
	16r3015	"RIGHT TORTOISE SHELL BRACKET	&#12309;"
	16r3017	"RIGHT WHITE LENTICULAR BRACKET	&#12311;"
	16r3019	"RIGHT WHITE TORTOISE SHELL BRACKET	&#12313;"
	16r301B	"RIGHT WHITE SQUARE BRACKET	&#12315;"
	16rFE38	"PRESENTATION FORM FOR VERTICAL RIGHT CURLY BRACKET	&#65080;"
	16rFE3A	"PRESENTATION FORM FOR VERTICAL RIGHT TORTOISE SHELL BRACKET	&#65082;"
	16rFE3C	"PRESENTATION FORM FOR VERTICAL RIGHT BLACK LENTICULAR BRACKET	&#65084;"
	16rFE3E	"PRESENTATION FORM FOR VERTICAL RIGHT DOUBLE ANGLE BRACKET	&#65086;"
	16rFE40	"PRESENTATION FORM FOR VERTICAL RIGHT ANGLE BRACKET	&#65088;"
	16rFE42	"PRESENTATION FORM FOR VERTICAL RIGHT CORNER BRACKET	&#65090;"
	16rFE44	"PRESENTATION FORM FOR VERTICAL RIGHT WHITE CORNER BRACKET	&#65092;"
	16rFE48	"PRESENTATION FORM FOR VERTICAL RIGHT SQUARE BRACKET	&#65096;"
	16rFE5C	"SMALL RIGHT CURLY BRACKET	&#65116;"
	16rFE5E	"SMALL RIGHT TORTOISE SHELL BRACKET	&#65118;"
	16rFF3D	"FULLWIDTH RIGHT SQUARE BRACKET	&#65341;"
	16rFF5D	"FULLWIDTH RIGHT CURLY BRACKET	&#65373;"
	16rFF63	"HALFWIDTH RIGHT CORNER BRACKET	&#65379;"
	) includes: charOrCodePt value
! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 12:24:31'!
isSeparator: charOrCodePt
	"Answer true if Unicode Separator OR Smalltalk Separator"
	| numericValue |
	numericValue := charOrCodePt value.
	^ (((self generalCategoryCodeFor: numericValue) 
			bitAnd: SeparatorBit) = SeparatorBit)
		"LF, FF, Space, Tab, CR"
		or: [numericValue = 16r0085] "NextLine"
		or:  [(numericValue < 16rFF) 
				and: [numericValue asCharacter isSeparator]]
		
" Separator = Zl + Zp + Zs:

0020;SPACE;Zs;0;WS;;;;;N;;;;;
00A0;NO-BREAK SPACE;Zs;0;CS;<noBreak> 0020;;;;N;NON-BREAKING SPACE;;;;
1680;OGHAM SPACE MARK;Zs;0;WS;;;;;N;;;;;
180E;MONGOLIAN VOWEL SEPARATOR;Zs;0;WS;;;;;N;;;;;
2000;EN QUAD;Zs;0;WS;2002;;;;N;;;;;
2001;EM QUAD;Zs;0;WS;2003;;;;N;;;;;
2002;EN SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
2003;EM SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
2004;THREE-PER-EM SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
2005;FOUR-PER-EM SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
2006;SIX-PER-EM SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
2007;FIGURE SPACE;Zs;0;WS;<noBreak> 0020;;;;N;;;;;
2008;PUNCTUATION SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
2009;THIN SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
200A;HAIR SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;
202F;NARROW NO-BREAK SPACE;Zs;0;CS;<noBreak> 0020;;;;N;;;;;
205F;MEDIUM MATHEMATICAL SPACE;Zs;0;WS;<compat> 0020;;;;N;;;;;

3000;IDEOGRAPHIC SPACE;Zs;0;WS;<wide> 0020;;;;N;;;;;

2028;LINE SEPARATOR;Zl;0;WS;;;;;N;;;;;

2029;PARAGRAPH SEPARATOR;Zp;0;B;;;;;N;;;;;

***Nota Bene***=== 
**NOT** Classed as Separators by Unicode General Property:

0009;<control>;Cc;0;S;;;;;N;CHARACTER TABULATION (HT);;;;
000A;<control>;Cc;0;B;;;;;N;LINE FEED (LF);;;;
000B;<control>;Cc;0;S;;;;;N;LINE TABULATION (VT);;;;
000C;<control>;Cc;0;WS;;;;;N;FORM FEED (FF);;;;
000D;<control>;Cc;0;B;;;;;N;CARRIAGE RETURN (CR);;;;

0085;<control>;Cc;0;B;;;;;N;NEXT LINE (NEL);;;;
==============================

"! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 12:25:12'!
isSpace: charOrCodePt

	^ self hasTagSpaceSeparator: charOrCodePt! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 12:26:11'!
isSymbolGyph: charOrCodePt

	"We can't use #isSymbol without confusion with Smalltalk Symbols"
	^ (((self generalCategoryCodeFor: charOrCodePt) bitAnd: SymbolBit)
		 = SymbolBit)! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/15/2022 12:26:42'!
isUppercase: charOrCodePt

	^ self hasTagUppercase: charOrCodePt! !

!UniCode class methodsFor: 'testing' stamp: 'KenD 5/14/2022 12:08:54'!
isWordBreakBetween: leftChar and:  rightChar
	"Answer true if a Word break is allowed between the two characters."

	"See Unicode Anned 29: Unicode Text Segmenation"

	"@@FIXME: brute force@@"
	| leftGenProp rightGenProp leftLineProp rightLineProp |
	leftGenProp := leftChar generalCategoryCode.
	rightGenProp := rightChar generalCategoryCode.
	leftLineProp := leftChar lineBreakCategory.
	rightLineProp := rightChar lineBreakCategory.
	
	! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:20:27'!
AI
	^AL! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:20:22'!
AL
	^AL! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:20:17'!
B2
	^B2! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:20:13'!
BA
	^BA! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:20:08'!
BB
	^BB! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:20:03'!
BK
	^BK! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:19:57'!
CB
	^CB! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:19:52'!
CJ
	^CJ! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:19:47'!
CL
	^CL! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:19:43'!
CM
	^CM! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:19:38'!
CP
	^CP! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:19:32'!
CR
	^CR! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:56:02'!
Cc
	"Other Control"
	^Cc! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:56:16'!
Cf
	"Other Format"
	^Cf! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:57:02'!
Cn
	"Other Not Assigned"
	^Cn! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:56:43'!
Co
	"Other Private Use"
	^Co! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:56:31'!
Cs
	"Other Surrogate"
	^Cs! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:19:00'!
EX
	^EX! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 11:01:26'!
GL
	"Linebreak Glue"
	^GL! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:48'!
H2
	^H2! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:43'!
H3
	^H3! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:38'!
HL
	^HL! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:32'!
HY
	^HY! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:27'!
ID
	^ID! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:22'!
IN
	^IN! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:16'!
IS
	^IS! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:11'!
JL
	^JL! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:07'!
JT
	^JT! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:18:01'!
JV
	^JV! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:49:17'!
LF
	^LF! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:45:18'!
Ll
	"Letter LowerCase"
	^Ll! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:45:35'!
Lm
	"Letter Modifier"
	^Lm! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:45:53'!
Lo
	"Letter Other"
	^Lo! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:46:09'!
Lt
	"Letter TitleCase"
	^Lt! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:45:05'!
Lu
	"Letter UpperCase"
	^Lu! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:47:00'!
Mc
	"Mark spacing Combining"
	^Mc! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:47:56'!
Me
	"Mark Enclosing"
	^Me! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:47:35'!
Mn
	"Mark NonSpacing"
	^Mn! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:17:06'!
NL
	^NL! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:17:01'!
NS
	^NS! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:16:55'!
NU
	^NU! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:48:38'!
Nd
	"Number Decimal Digit"
	^Nd! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:48:51'!
Nl
	"Number Letter"
	^Nl! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:49:04'!
No
	"Number Other"
	^No! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:16:33'!
OP
	^OP! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:16:26'!
PO
	^PO! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:16:22'!
PR
	^PR! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:49:56'!
Pc
	"Punctuation Connector"
	^Pc! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:50:13'!
Pd
	"Punctuation Dash"
	^Pd! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:51:12'!
Pe
	"Punctuation Closing Bracket"
	^Pe! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:52:09'!
Pf
	"Punctuation Final Quote"
	^Pf! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:52:21'!
Pi
	"Punctuation Initial Quote"
	^Pi! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:52:53'!
Po
	"Punctuation Other"
	^Po! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:51:36'!
Ps
	"Punctuation Opening Bracket"
	^Ps! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:15:41'!
QU
	^QU! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:15:34'!
RI
	^RI! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:15:29'!
SA
	^SA! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:15:23'!
SG
	^SG! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:15:18'!
SP
	^SP! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:15:13'!
SY
	^SY! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:53:40'!
Sc
	"Symbol Currency"
	^Sc! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:53:57'!
Sk
	"Symbol Modifier"
	^Sk! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:53:22'!
Sm
	"Symbol Math"
	^Sm! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:54:08'!
So
	"Symbol Other"
	^So! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:13:20'!
WJ
	^WJ! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:13:15'!
XX
	^XX! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:13:09'!
ZW
	^ZW! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:54:57'!
Zl
	"Ssparator Line"
	^Zl! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:55:09'!
Zp
	"Ssparator Paragraph"
	^Zp! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 07:54:47'!
Zs
	"Ssparator Space"
	^Zs! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 12:49:41'!
charCouldBeInsideWord: charOrCodePt
	"Answer true if this character's codePoint could be inside 'word'."
	
	^ ( ((self generalCategoryCodeFor: charOrCodePt) 
			anyMask: (LetterBit + NumberBit ))
		"See UniChar class>>initializeGeneralPropertyEnums "
			or: [ ({ CM. GL. IN. IS. H2. H3. HL. HY. JL. JT. JV. PO. PR. NS. WJ. SG. }
					includes: (self lineBreakCategoryCodeFor: charOrCodePt))
					or: [self hasTagDecimalNumber: charOrCodePt] ] )
		 "See UniChar class>>initializeLineBreakProperties "
	! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 12:50:27'!
charCouldEndWord: charOrCodePt
	"Answer true if this character could start a 'word'."
	
	^ ( ((self generalCategoryCodeFor: charOrCodePt) 
			anyMask: (LetterBit + NumberBit ))
		"See UniChar class>>initializeGeneralPropertyEnums "
			or: [ {  CM. GL. IN. H2. H3. HL. JL. JT. JV. PO. PR. NS. WJ. SG. }
					includes: (self lineBreakCategoryCodeFor: charOrCodePt) ]	)! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 12:51:05'!
charCouldStartWord: charOrCodePt
	"Answer true if this character could start a 'word'."
	
	^ ((self generalCategoryCodeFor: charOrCodePt) 
			anyMask: (LetterBit + NumberBit))
	! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 12:52:14'!
charIsGraphemePart: charOrCodePt
	"Answer true if my codePoint is a grapheme cluster component."
	
	"Hangul Jamo (H2 H3 JL JT JV) is tested separately: UniChar>>isHangulJamo .
	 Regional Indocators (RI tested separately; UniChar>>isRegionalIndicator .
	 Formatting Marks (Cf) are tested separately: UniChar>>isFormattingMark .
	"

	^ ( ( { Mc. Mn. Lm. Sk.  } 
				includes: (self generalCategoryCodeFor: charOrCodePt) ) 
		"See UniChar class>>initializeGeneralPropertyEnums "
		or: [ { CM. WJ. } 
				includes: (self lineBreakCategoryCodeFor: charOrCodePt)] 
		 "See UniChar class>>initializeLineBreakProperties "
	   )
		
	! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:12:44'!
defaultBreakDisplayChar
	"Answer a character used to display (char|word|line) breaks in test code"
	^DefaultBreakChar ! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 10:52:55'!
generalCategoryCodeFor: charOrCodePt

	(self isCJKIdeograph: charOrCodePt)
	ifTrue: [ ^ Lo bitAnd: (ID bitShift: 16) ]
	ifFalse: [ ^(GeneralCategory at: charOrCodePt value ifAbsent: [ Cn ])
				 bitAnd: 16r00FFFF]! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 10:46:10'!
lineBreakCategoryCodeFor: charOrCodePt

	(self isCJKIdeograph: charOrCodePt)
	ifTrue: [ ^ ID ]
	ifFalse: [ ^ ((GeneralCategory at: charOrCodePt value ifAbsent: [ 0 ])
					 bitAnd: 16r00FF0000) bitShift: -16 ]! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 14:35:05'!
lineBreakNameAt: anIndex

	^ LineBreakNames at: anIndex! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:09:59'!
lineBreakPropNameAt: lineBreakPropertyCode

	(lineBreakPropertyCode isZero)
	ifTrue: [ ^ #Unknown ]
	ifFalse: [ ^ LineBreakProperties at: lineBreakPropertyCode ]! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/14/2022 12:10:10'!
lineBreakTableAt: row at: col
	"Answer the character specified"

	"See comments in UniChar class>>initializeLineBreakTable"
	
	^ (LineBreakTable at: row) at: col! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 12:53:38'!
nextLVTStateFromState: aState forChar: charOrCodePt
	"aState is one of L V T LV LVT or zero (=> exit). 
	Answer next state based on my lineBreakCategoryCode"
	
	"Note table 1c in  Unicode Annex #29: Unicode Text Segmentation
	and UniChar class>>initializeHangulJamoLVT"
	| index |
	(aState between: 1 and: 5) ifFalse: [ ^ 0 ]. "zero" 
	index := LVTStateMap at: (self lineBreakCategoryCodeFor: charOrCodePt).
	(index isZero)
		ifTrue: [ ^ 0 ] "zero"
		ifFalse: [ ^ (LVTStateVec at: aState) at: index ] "Next State"! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 14:31:55'!
propNamesForCode: propCode
	
	| lineBreakProp lineBreakPropName generalPropName |
	(propCode isZero) ifTrue: [ ^ #(Unknown. Unknown.) ].
	generalPropName := PropertyNames at: (propCode bitAnd: 16r00FFFF).
	lineBreakProp := ((propCode bitAnd: 16r00FF0000) bitShift: -16).
	(lineBreakProp isZero) 
	ifTrue: [ lineBreakPropName := #Unknown]
	ifFalse: [ lineBreakPropName := LineBreakProperties at: lineBreakProp].

	^ { generalPropName.  lineBreakPropName }! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 08:16:40'!
propStats
"
	UniCode propStats.
"

	| propCountsDict "countsDict" valueCounterProc |
	
	valueCounterProc :=
		[ :dict | | countDict |
			countDict := IdentityDictionary new.
			dict valuesDo: [ :val |
				countDict at: val
						   put: (1 + (countDict at: val ifAbsent: [0]))
		].
		countDict
	].

	"Count shared codePoints"
	propCountsDict := valueCounterProc value: GeneralCategory.
	
	Transcript newLine .
	propCountsDict keysAndValuesDo: [ :key :count |
		(count > 900)
		ifTrue: [
				Transcript newLine.
				Transcript show: 'Count: ', 
								count asString , 
								' PropCode: ', 
								key hex,
								'  ', 
								((UniCode propNamesForCode: key) asString).
		]
	].
	Transcript newLine .

	"Count number of times a codepoint is shared with the same count"
"
	countsDict := valueCounterProc value: propCountsDict.
	
	^ { propCountsDict. countsDict. }
"
	^ propCountsDict 
			! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 13:04:44'!
rangeInfo2: charOrCodePt
	"Answer something about me"
	| codePoint |
	codePoint := charOrCodePt value.
	
(codePoint between: 16r0590 and: 16r05FF) ifTrue: [ ^ #( 'Middle Eastern' 'Hebrew' )].
(codePoint between: 16r0600 and: 16r06FF) ifTrue: [ ^ #( 'Middle Eastern' 'Arabic' )].
(codePoint between: 16r0700 and: 16r074F) ifTrue: [ ^ #( 'Middle Eastern' 'Syriac' )].
(codePoint between: 16r0780 and: 16r07BF) ifTrue: [ ^ #( 'Middle Eastern' 'Thaana' )].

(codePoint between: 16r0900 and: 16r097F) ifTrue: [ ^ #( 'South Asian 1' 'Devanagari' )].
(codePoint between: 16r0980 and: 16r09FF) ifTrue: [ ^ #( 'South Asian 1' 'Bengali' )].
(codePoint between: 16r0A00 and: 16r0A7F) ifTrue: [ ^ #( 'South Asian 1' 'Gurmukhi' )].
(codePoint between: 16r0A80 and: 16r0AFF) ifTrue: [ ^ #( 'South Asian 1' 'Gujarati' )].
(codePoint between: 16r0B00 and: 16r0B7F) ifTrue: [ ^ #( 'South Asian 1' 'Oriya' )].
(codePoint between: 16r0B80 and: 16r0BFF) ifTrue: [ ^ #( 'South Asian 1' 'Tamil' )].
(codePoint between: 16r0C00 and: 16r0C7F) ifTrue: [ ^ #( 'South Asian 1' 'Telugu' )].
(codePoint between: 16r0C80 and: 16r0CFF) ifTrue: [ ^ #( 'South Asian 1' 'Kannada' )].
(codePoint between: 16r0D00 and: 16r0D7F) ifTrue: [ ^ #( 'South Asian 1' 'Malayalam' )].
(codePoint between: 16r0D80 and: 16r0DFF) ifTrue: [ ^ #( 'South Asian 1' 'Sinhala' )].

(codePoint between: 16r0E00 and: 16r0E7F) ifTrue: [ ^ #( 'Southeastern 1' 'Thai' )].
(codePoint between: 16r0E80 and: 16r0EFF) ifTrue: [ ^ #( 'Southeastern 1' 'Lao' )].

(codePoint between: 16r0F00 and: 16r0FFF) ifTrue: [ ^ #( 'South Asian 1' 'Tibetan' )].

(codePoint between: 16r1000 and: 16r109F) ifTrue: [ ^ #( 'Southeastern 1' 'Myanmar' )].

(codePoint between: 16r10A0 and: 16r10FF) ifTrue: [ ^ #( 'European Alphabetic 2' 'Georgian' )].

(codePoint between: 16r1100 and: 16r11FF) ifTrue: [ ^ #( 'Korean' 'Hangul Jamo' )].

(codePoint between: 16r1200 and: 16r137F) ifTrue: [ ^ #( 'Additional 1' 'Ethiopic' )].
(codePoint between: 16r13A0 and: 16r13FF) ifTrue: [ ^ #( 'Additional 1' 'Cherokee' )].
(codePoint between: 16r1400 and: 16r167F) ifTrue: [ ^ #( 'Additional 1' 'Unified Canadian Aboriginal Syllabics' )].

(codePoint between: 16r1680 and: 16r169F) ifTrue: [ ^ #( 'European Alphabetic 3' 'Ogham' )].
(codePoint between: 16r16A0 and: 16r16FF) ifTrue: [ ^ #( 'European Alphabetic 3' 'Runic' )].

(codePoint between: 16r1700 and: 16r171F) ifTrue: [ ^ #( 'Southeastern 2' 'Tagalog' )].
(codePoint between: 16r1720 and: 16r173F) ifTrue: [ ^ #( 'Southeastern 2' 'Hanunoo' )].
(codePoint between: 16r1740 and: 16r175F) ifTrue: [ ^ #( 'Southeastern 2' 'Buhid' )].
(codePoint between: 16r1760 and: 16r177F) ifTrue: [ ^ #( 'Southeastern 2' 'Tagbanwa' )].
(codePoint between: 16r1780 and: 16r17FF) ifTrue: [ ^ #( 'Southeastern 2' 'Khmer' )].

(codePoint between: 16r1800 and: 16r18AF) ifTrue: [ ^ #( 'Additional 2' 'Mongolian' )].

(codePoint between: 16r1E00 and: 16r1EFF) ifTrue: [ ^ #( 'European Alphabetic 4' 'Latin Extended Additional' )].
(codePoint between: 16r1F00 and: 16r1FFF) ifTrue: [ ^ #( 'European Alphabetic 4' 'Greek Extended' )].

(codePoint between: 16r2000 and: 16r206F) ifTrue: [ ^ #( 'Symbols 2' 'General Punctuation' )].
(codePoint between: 16r2070 and: 16r209F) ifTrue: [ ^ #( 'Symbols 2' 'Superscripts and Subscripts' )].
(codePoint between: 16r20A0 and: 16r20CF) ifTrue: [ ^ #( 'Symbols 2' 'Currency Symbols' )].
(codePoint between: 16r20D0 and: 16r20FF) ifTrue: [ ^ #( 'Symbols 2' 'Combining Diacritical Marks for Symbols' )].
(codePoint between: 16r2100 and: 16r214F) ifTrue: [ ^ #( 'Symbols 2' 'Letterlike Symbols' )].
(codePoint between: 16r2150 and: 16r218F) ifTrue: [ ^ #( 'Symbols 2' 'Number Forms' )].
(codePoint between: 16r2190 and: 16r21FF) ifTrue: [ ^ #( 'Symbols 2' 'Arrows' )].
(codePoint between: 16r2200 and: 16r22FF) ifTrue: [ ^ #( 'Symbols 2' 'Mathematical Operators' )].
(codePoint between: 16r2300 and: 16r23FF) ifTrue: [ ^ #( 'Symbols 2' 'Miscellaneous Technical' )].
(codePoint between: 16r2400 and: 16r243F) ifTrue: [ ^ #( 'Symbols 2' 'Control Pictures' )].
(codePoint between: 16r2440 and: 16r245F) ifTrue: [ ^ #( 'Symbols 2' 'Optical Character Recognition' )].
(codePoint between: 16r2460 and: 16r24FF) ifTrue: [ ^ #( 'Symbols 2' 'Enclosed Alphanumerics' )].
(codePoint between: 16r2500 and: 16r257F) ifTrue: [ ^ #( 'Symbols 2' 'Box Drawing' )].
(codePoint between: 16r2580 and: 16r259F) ifTrue: [ ^ #( 'Symbols 2' 'Block Elements' )].
(codePoint between: 16r25A0 and: 16r25FF) ifTrue: [ ^ #( 'Symbols 2' 'Geometric Shapes' )].
(codePoint between: 16r2600 and: 16r26FF) ifTrue: [ ^ #( 'Symbols 2' 'Miscellaneous Symbols' )].
(codePoint between: 16r2700 and: 16r27BF) ifTrue: [ ^ #( 'Symbols 2' 'Dingbats' )].
(codePoint between: 16r27C0 and: 16r27EF) ifTrue: [ ^ #( 'Symbols 2' 'Miscellaneous Mathematical Symbols-A' )].
(codePoint between: 16r27F0 and: 16r27FF) ifTrue: [ ^ #( 'Symbols 2' 'Supplemental Arrows-A' )].
(codePoint between: 16r2800 and: 16r28FF) ifTrue: [ ^ #( 'Symbols 2' 'Braille Patterns' )].
(codePoint between: 16r2900 and: 16r297F) ifTrue: [ ^ #( 'Symbols 2' 'Supplemental Arrows-B' )].
(codePoint between: 16r2980 and: 16r29FF) ifTrue: [ ^ #( 'Symbols 2' 'Miscellaneous Mathematical Symbols-B' )].
(codePoint between: 16r2A00 and: 16r2AFF) ifTrue: [ ^ #( 'Symbols 2' 'Supplemental Mathematical Operators' )].

(codePoint between: 16r2E80 and: 16r2EFF) ifTrue: [ ^ #( 'CJK' 'CJK Radicals Supplement' )].
(codePoint between: 16r2F00 and: 16r2FDF) ifTrue: [ ^ #( 'CJK' 'Kangxi Radicals' )].
(codePoint between: 16r2FF0 and: 16r2FFF) ifTrue: [ ^ #( 'CJK' 'Ideographic Description Characters' )].
(codePoint between: 16r3000 and: 16r303F) ifTrue: [ ^ #( 'CJK' 'CJK Symbols and Punctuation' )].
(codePoint between: 16r3040 and: 16r309F) ifTrue: [ ^ #( 'CJK' 'Hiragana' )].
(codePoint between: 16r30A0 and: 16r30FF) ifTrue: [ ^ #( 'CJK' 'Katakana' )].
(codePoint between: 16r3100 and: 16r312F) ifTrue: [ ^ #( 'CJK' 'Bopomofo' )].
(codePoint between: 16r3130 and: 16r318F) ifTrue: [ ^ #( 'CJK' 'Hangul Compatibility Jamo' )].
(codePoint between: 16r3190 and: 16r319F) ifTrue: [ ^ #( 'CJK' 'Kanbun' )].
(codePoint between: 16r31A0 and: 16r31BF) ifTrue: [ ^ #( 'CJK' 'Bopomofo Extended' )].
(codePoint between: 16r31F0 and: 16r31FF) ifTrue: [ ^ #( 'CJK' 'Katakana Phonetic Extensions' )].
(codePoint between: 16r3200 and: 16r32FF) ifTrue: [ ^ #( 'CJK' 'Enclosed CJK Letters and Months' )].
(codePoint between: 16r3300 and: 16r33FF) ifTrue: [ ^ #( 'CJK' 'CJK Compatibility' )].
(codePoint between: 16r3400 and: 16r4DBF) ifTrue: [ ^ #( 'CJK' 'CJK Unified Ideographs Extension A' )].
(codePoint between: 16r4E00 and: 16r9FFF) ifTrue: [ ^ #( 'CJK' 'CJK Unified Ideographs' )].
(codePoint between: 16rA000 and: 16rA48F) ifTrue: [ ^ #( 'CJK' 'Yi Syllables' )].
(codePoint between: 16rA490 and: 16rA4CF) ifTrue: [ ^ #( 'CJK' 'Yi Radicals' )].

^self rangeInfo3: charOrCodePt "too many literals for 1 method"! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 13:08:02'!
rangeInfo3: charOrCodePt
	"Answer something about me"
	| codePoint |
	codePoint := charOrCodePt value.
	
(codePoint between: 16rAC00 and: 16rD7AF) ifTrue: [ ^ #( 'Korean' 'Hangul Syllables' )].

(codePoint between: 16rD800 and: 16rDB7F) ifTrue: [ ^ #( 'Special' 'High Surrogates' )].
(codePoint between: 16rDB80 and: 16rDBFF) ifTrue: [ ^ #( 'Special' 'High Private Use Surrogates' )].
(codePoint between: 16rDC00 and: 16rDFFF) ifTrue: [ ^ #( 'Special' 'Low Surrogates' )].
(codePoint between: 16rE000 and: 16rF8FF) ifTrue: [ ^ #( 'Special' 'Private Use Area' )].

(codePoint between: 16rF900 and: 16rFAFF) ifTrue: [ ^ #( 'CJK' 'CJK Compatibility Ideographs' )].

(codePoint between: 16rFB00 and: 16rFB4F) ifTrue: [ ^ #( 'Middle Eastern 2' 'Alphabetic Presentation Forms' )].
(codePoint between: 16rFB50 and: 16rFDFF) ifTrue: [ ^ #( 'Middle Eastern 2' 'Arabic Presentation Forms-A' )].

(codePoint between: 16rFE00 and: 16rFE0F) ifTrue: [ ^ #( 'Special' 'Variation Selectors' )].
(codePoint between: 16rFE20 and: 16rFE2F) ifTrue: [ ^ #( 'Special' 'Combining Half Marks' )].

(codePoint between: 16rFE30 and: 16rFE4F) ifTrue: [ ^ #( 'CJK' 'CJK Compatibility Forms' )].

(codePoint between: 16rFE50 and: 16rFE6F) ifTrue: [ ^ #( 'Symbol 3' 'Small Form Variants' )].

(codePoint between: 16rFE70 and: 16rFEFF) ifTrue: [ ^ #( 'Middle Eastern 3' 'Arabic Presentation Forms-B' )].

(codePoint between: 16rFF00 and: 16rFFEF) ifTrue: [ ^ #( 'Specials' 'Halfwidth and Fullwidth Forms' )].
(codePoint between: 16rFFF0 and: 16rFFFF) ifTrue: [ ^ #( 'Specials' 'Specials' )].

(codePoint between: 16r10300 and: 16r1032F) ifTrue: [ ^ #( 'European' 'Old Italic' )].
(codePoint between: 16r10330 and: 16r1034F) ifTrue: [ ^ #( 'European' 'Gothic' )].
(codePoint between: 16r10400 and: 16r1044F) ifTrue: [ ^ #( 'European' 'Deseret' )].

(codePoint between: 16r1D000 and: 16r1D0FF) ifTrue: [ ^ #( 'Symbols' 'Byzantine Musical Symbols' )].
(codePoint between: 16r1D100 and: 16r1D1FF) ifTrue: [ ^ #( 'Symbols' 'Musical Symbols' )].
(codePoint between: 16r1D400 and: 16r1D7FF) ifTrue: [ ^ #( 'Symbols' 'Mathematical Alphanumeric Symbols' )].

(codePoint between: 16r20000 and: 16r2A6DF) ifTrue: [ ^ #( 'CJK' 'CJK Unified Ideographs Extension B' )].
(codePoint between: 16r2F800 and: 16r2FA1F) ifTrue: [ ^ #( 'CJK' 'CJK Compatibility Ideographs Supplement' )].

(codePoint between: 16rE0000 and: 16rE007F) ifTrue: [ ^ #( 'Special' 'Tags' )].
(codePoint between: 16rF0000 and: 16rFFFFF) ifTrue: [ ^ #( 'Special' 'Supplementary Private Use Area-A' )].
(codePoint between: 16r100000 and: 16r10FFFF) ifTrue: [ ^ #( 'Special' 'Supplementary Private Use Area-B' )].

"Default: 
  Which is worse: Ignorance or Apathy?
   Who knows, and who cares?"
^ #( 'Unassigned' 'Unknown' )
! !

!UniCode class methodsFor: 'private' stamp: 'KenD 5/15/2022 08:15:11'!
zeroCodePoints
	
	^ZeroCodePoints! !

!Object methodsFor: '*System-Text-UnicodeSupport' stamp: 'KenD 5/14/2022 09:17:35'!
beReadOnly

	^ self setIsReadOnlyObject: true; yourself! !

!Object methodsFor: '*System-Text-UnicodeSupport' stamp: 'KenD 5/14/2022 09:12:46'!
setIsReadOnlyObject: aBoolean
	"If the VM supports read-only objects it will not write to read-only objects.
	 An attempt to write to an instance variable of a read-only object will
	 cause the VM to send attemptToAssign:withIndex: to the read-only object.
	 An attempt to modify a read-only object in a primitive will cause the
	 primitive to fail with a #'no modification' error code.
	 This primitive sets the read-only flag of the receiver to the given
	 value and answers the previous vaue of the flag.
	 Note: Some objects can't be read-only, currently contexts and objects related
	 to process scheduling (Processor, Process instances, Semaphore instances, ...)"
	<primitive: 164 error: ec>
	^self primitiveFailed! !

!Character methodsFor: '*System-Text-UnicodeSupport' stamp: 'KenD 5/15/2022 14:00:57'!
between: min and: max
	| numericValue |
	numericValue := self value.
	^ numericValue >= min and: [numericValue <= max]! !

!Character methodsFor: '*System-Text-UnicodeSupport' stamp: 'KenD 5/14/2022 14:16:52'!
value

	^ self numericValue ! !

!UnicodeCodePoint methodsFor: '*System-Text-UnicodeSupport' stamp: 'KenD 5/14/2022 14:21:01'!
between: min and: max
	
	^ value >= min and: [value <= max]! !

!UnicodeCodePoint methodsFor: '*System-Text-UnicodeSupport' stamp: 'KenD 5/15/2022 14:18:49'!
value

	^ value! !
UniCode initialize!
