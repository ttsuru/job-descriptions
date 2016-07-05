# Increments Job Descriptions

[![Build Status](https://travis-ci.org/increments/job-descriptions.svg?branch=master)](https://travis-ci.org/increments/job-descriptions)
[![Code Climate](https://codeclimate.com/github/increments/job-descriptions/badges/gpa.svg)](https://codeclimate.com/github/increments/job-descriptions)

[Increments株式会社](http://increments.co.jp/)における各職種のJob Descriptionを公開しています。

## 公開中のJob Descriptions

- [Application Engineer Job Description](https://github.com/increments/job-descriptions/blob/master/application_engineer.ja.md)
- [NLP & Search Engineer Job Description](https://github.com/increments/job-descriptions/blob/master/nlp_search_engineer.ja.md)
- [Product Manager Job Description](https://github.com/increments/job-descriptions/blob/master/product_manager.ja.md)
- [Designer Job Description](https://github.com/increments/job-descriptions/blob/master/designer.ja.md)

## エントリー

```
$ open http://bit.ly/increments-job-apply
```

## ライセンス

このコンテンツは、特に明示されている場合を除いて、次のライセンスに従います。

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="http://increments.co.jp">
    <span property="dct:title">Increments</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">Increments Job Descriptions</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="JP" about="http://increments.co.jp">
  日本</span>.
</p>

## Gem

### Install

```rb
gem 'increments-job_descriptions', github: 'increments/job-descriptions'
```

### Usage

```rb
require 'increments-job_descriptions'

job_description = Increments::JobDescriptions['application_engineer.ja.md']
job_description.filename #=> 'application_engineer.ja.md'
job_description.title    #=> 'Application Engineer Job Description'
job_description.to_s     # markdown
job_description.to_html  # html
```
