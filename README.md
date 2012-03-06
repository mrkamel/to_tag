
# to_tag

Transform words into tags and multiple words into multiple tags
without loosing search operators

<pre>
irb> "süden".to_tag
=> "sueden"
>> "coca-cola -trinken".to_tags
irb> "coca cola -trinken"
</pre>

