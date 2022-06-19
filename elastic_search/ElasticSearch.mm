<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1590991555833" ID="7bv7t971ujpcsvo4c5gda5atsb" MODIFIED="1590991555833" TEXT="ElasticSearch">
<node CREATED="1590991555833" ID="2ksr45f392idk29566uv9gs4q4" MODIFIED="1590991555833" POSITION="right" TEXT="2_getting basic information">
<node CREATED="1590991555833" ID="01lvgnm2s3anbbrjkiajav19on" MODIFIED="1590997911384" TEXT="Checking the shard distribution">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">GET /_cat/shards?v</font></span>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1590991555833" ID="1e311l8creuf0k22esg376pijf" MODIFIED="1590991555833" TEXT="Inspecting the cluster">
<node CREATED="1590991555833" ID="6dpmu06vgejpe0ss6c9cb41c4l" MODIFIED="1590997920734" TEXT="Checking the cluster&apos;s health">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">GET /_cluster/health</font></span>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1590991555833" ID="746ieq81qdvr012kle1msvm8kh" MODIFIED="1590997923863" TEXT="Listing the cluster&apos;s nodes (and their roles)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">GET /_cat/nodes?v</font></span>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1590991555833" ID="0t0q5b53de9f43h0no7kqgh29r" MODIFIED="1590997928180" TEXT="Listing the cluster&apos;s indices">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">GET /_cat/indices?v</font></span>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="4utm72ct1burfughhkgsp2jkm1" MODIFIED="1590991555833" TEXT="Adding more nodes to the cluster (for development)">
<node CREATED="1590991555833" ID="0dtg546k8u2e0bdd09v4498rmn" MODIFIED="1590991555833" TEXT="Starting up a node from an existing node&apos;s directory">
<node CREATED="1590991555833" ID="0u8gcg5ehpjnj063guc43jqf8u" MODIFIED="1590997930558" TEXT="macOS/Linux">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">bin/elasticsearch -E node.name=node-3 -E path.data=./node-3/data -E path.logs=./node-3/logs</font></span>
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1590991555833" ID="3oomp469fv2s8ci924okuaj2tt" MODIFIED="1590997935687" TEXT="Windows">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">bin\elasticsearch.bat -E node.name=node-3 -E path.data=.\node-3\data -E path.logs=.\node-3\logs</font></span>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="2p7r2gq4ulc5vcc2t7l5avh7d2" MODIFIED="1590997944992" TEXT="Understanding replication">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ## Creating a new index<br /><br />```<br />PUT /pages<br />```
    </p>
    <ul>
      <li>
        ## Checking the cluster's health<br /><br />```<br />GET /_cluster/health<br />```

        <ul>
          <li>
            ## Listing the cluster's indices<br /><br />```<br />GET /_cat/indices?v<br />```

            <ul>
              <li>
                ## Listing the cluster's shards<br /><br />```<br />GET /_cat/shards?v<br />```
              </li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="2ctq4p07ns21hhguuj7mmlhujr" MODIFIED="1590991555833" POSITION="right" TEXT="3_managing documents">
<node CREATED="1590991555833" ID="01gg21r3gje9o66gcfjhgcg49g" MODIFIED="1590991555833" TEXT="batch processing">
<node CREATED="1590991555833" ID="5oif3aroclak4hpi51490cnaq3" MODIFIED="1590991555833" TEXT="Indexing documents">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_bulk<br/>{ "index": { "_index": "products", "_id": 200 } }<br/>{ "name": "Espresso Machine", "price": 199, "in_stock": 5 }<br/>{ "create": { "_index": "products", "_id": 201 } }<br/>{ "name": "Milk Frother", "price": 149, "in_stock": 14 }<br/>POST /_bulk<br/>{ "update": { "_index": "products", "_id": 201 } }<br/>{ "doc": { "price": 129 } }<br/>{ "delete": { "_index": "products", "_id": 200 } }<br/>POST /products/_bulk<br/>{ "update": { "_id": 201 } }<br/>{ "doc": { "price": 129 } }<br/>{ "delete": { "_id": 200 } }<br/><br/>GET /products/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0s2h960iki12ng3qbfqdj8kha7" MODIFIED="1590991555833" TEXT="Updating and deleting documents">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_bulk<br/>{ "update": { "_index": "products", "_id": 201 } }<br/>{ "doc": { "price": 129 } }<br/>{ "delete": { "_index": "products", "_id": 200 } }<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="56c3f8jl7j1h6lhgfk25khjrau" MODIFIED="1590991555833" TEXT="Specifying the index name in the request path">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_bulk<br/>{ "update": { "_id": 201 } }<br/>{ "doc": { "price": 129 } }<br/>{ "delete": { "_id": 200 } }<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3rihsedi829gbr4jlvlgrpl39e" MODIFIED="1590991555833" TEXT="Retrieving all documents">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /products/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3i6c9ndmaptjjf366or4hrvgl0" MODIFIED="1590991555833" TEXT="we can use /_bulk  and /products/_bulk &#xd;&#xa;/_bulk will gives us more flexibility"/>
</node>
<node CREATED="1590991555833" ID="4m9jmqundceklh8ancc9kp9vnm" MODIFIED="1590991555833" TEXT="creating and deleting indices">
<node CREATED="1590991555833" ID="124au6f7f5rl0h0bhi6jiteu11" MODIFIED="1590991555833" TEXT="Deleting an index">
<richcontent TYPE="NOTE"><html><head/><body><p>DELETE /pages<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4b4i7u5cns42659oc41c5gl2q5" MODIFIED="1590991555833" TEXT="Creating an index (with settings)">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /products<br/>{<br/>&#xa0;&#xa0;"settings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"number_of_shards": 2,<br/>&#xa0;&#xa0;&#xa0;&#xa0;"number_of_replicas": 2<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3j5rttmgo51d47kpci6prmv35d" MODIFIED="1590991555833" TEXT="delete by query">
<node CREATED="1590991555833" ID="6fnpal1tue467adqe99p4vhkts" MODIFIED="1590991555833" TEXT="Deleting documents that match a given query">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_delete_by_query<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": { }<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="480dfq3fsigm2skmip76hr0ro9" MODIFIED="1590991555833" TEXT="Ignoring (counting) version conflicts">
<richcontent TYPE="NOTE"><html><head/><body><p>The `conflicts` key may be added as a query parameter instead, i.e. `?conflicts=proceed`.<br/><br/>```<br/>POST /products/_delete_by_query<br/>{<br/>&#xa0;&#xa0;"conflicts": "proceed",<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": { }<br/>&#xa0;&#xa0;}<br/>}<br/>```</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="4v1gauk9b79bdficnm9t5m15jr" MODIFIED="1590991555833" TEXT="deleting document">
<richcontent TYPE="NOTE"><html><head/><body><p>DELETE /products/_doc/101<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2ih84hcdu9fanbo9e0bn5lr4ba" MODIFIED="1590991555833" TEXT="importing data with curl">
<node CREATED="1590991555833" ID="7m506k3lhme4hqi08li7hk07dr" MODIFIED="1590991555833" TEXT="Navigating to bulk file directory"/>
<node CREATED="1590991555833" ID="4mjh0h54ln2vdau328vnd6u38q" MODIFIED="1590991555833" TEXT="Importing data into local cluster">
<richcontent TYPE="NOTE"><html><head/><body><p>curl -H "Content-Type: application/x-ndjson" -XPOST http://localhost:9200/products/_bulk --data-binary "@products-bulk.json"<br/><br/>products-bulk.json is a file</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="234edoed5athmpgppnfhrvbe16" MODIFIED="1590991555833" TEXT="Importing data into Elastic Cloud ">
<richcontent TYPE="NOTE"><html><head/><body><p>curl -H "Content-Type: application/x-ndjson" -XPOST -u username:password https://elastic-cloud-endpoint.com:9243/products/_bulk --data-binary "@products-bulk.json"</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0n5t84uuni0tsmbj61t0ip9gdk" MODIFIED="1590991555833" TEXT="indexing documents">
<node CREATED="1590991555833" ID="6hmt55cb16ciahve5jeijjfr8f" MODIFIED="1590991555833" TEXT="Indexing document with auto generated ID:">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_doc<br/>{<br/>&#xa0;&#xa0;"name": "Coffee Maker",<br/>&#xa0;&#xa0;"price": 64,<br/>&#xa0;&#xa0;"in_stock": 10<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4icfl29vca652kv21n4bnhrsck" MODIFIED="1590991555833" TEXT="Indexing document with custom ID:">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /products/_doc/100<br/>{<br/>&#xa0;&#xa0;"name": "Toaster",<br/>&#xa0;&#xa0;"price": 49,<br/>&#xa0;&#xa0;"in_stock": 4<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="749qtbug22otl43a8lifnslha6" MODIFIED="1590991555833" TEXT="optimistic concurrency control">
<node CREATED="1590991555833" ID="1bo9e2gi44pb90h4hgu53rhjah" MODIFIED="1590991555833" TEXT="Retrieve the document (and its primary term and sequence number)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /products/_doc/100</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="349lcq21ebmcqf2801v3u2nlj7" MODIFIED="1590991555833" TEXT="Update the `in_stock` field only if the document has not been updated since retrieving it">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100?if_primary_term=X&amp;if_seq_no=X<br/>{<br/>&#xa0;&#xa0;"doc": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"in_stock": 123<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="39rv0p5rvsk5hbpua9ve7ojs2u" MODIFIED="1590991555833" TEXT="replacing documents">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /products/_doc/100<br/>{<br/>&#xa0;&#xa0;"name": "Toaster",<br/>&#xa0;&#xa0;"price": 79,<br/>&#xa0;&#xa0;"in_stock": 4<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5cppfii11126t1e09csre9rp7j" MODIFIED="1590991555833" TEXT="retrieving documents by id">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /products/_doc/100<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6llrcc4mo82d35fingv02ui87r" MODIFIED="1590991555833" TEXT="scripted updates">
<node CREATED="1590991555833" ID="1obi4nhcjjam7g647u5gcc5i1n" MODIFIED="1590991555833" TEXT="Reducing the current value of `in_stock` by one">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100<br/>{<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": "ctx._source.in_stock--"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5e98pi10svmui1v5grtor4obq5" MODIFIED="1590991555833" TEXT="Assigning an arbitrary value to `in_stock`">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100<br/>{<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": "ctx._source.in_stock = 10"<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2qa1vdrndro7fjefk60rovlian" MODIFIED="1590991555833" TEXT="Using parameters within scripts">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100<br/>{<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": "ctx._source.in_stock -= params.quantity",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"params": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"quantity": 4<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2aa91joumipciq3telb987hjqb" MODIFIED="1590991555833" TEXT="Conditionally setting the operation to `noop`">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100<br/>{<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": """<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;if (ctx._source.in_stock == 0) {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx.op = 'noop';<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx._source.in_stock--;<br/>&#xa0;&#xa0;&#xa0;&#xa0;"""<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3qh49jgi3avdg2d17su3mvpeju" MODIFIED="1590991555833" TEXT="Conditionally update a field value">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100<br/>{<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": """<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;if (ctx._source.in_stock &gt; 0) {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx._source.in_stock--;<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;"""<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5e90dv3d9qvpsvjts27jbnso4h" MODIFIED="1590991555833" TEXT="Conditionally delete a document">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100<br/>{<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": """<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;if (ctx._source.in_stock &lt; 0) {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx.op = 'delete';<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx._source.in_stock--;<br/>&#xa0;&#xa0;&#xa0;&#xa0;"""<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="26pe3rlbap0fh815ejuuopd09c" MODIFIED="1590991555833" TEXT="update by query">
<node CREATED="1590991555833" ID="42pc566b2fkqgu8n4tuesmlmmj" MODIFIED="1590997964868" TEXT="Updating documents matching a query">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">note that there is no ; in the end of script </font></span>
    </p>
    <p>
      
    </p>
    <p>
      Replace the `match_all` query with any query that you would like.<br /><br />POST /products/_update_by_query<br />{<br />&#160;&#160;&quot;script&quot;: {<br />&#160;&#160;&#160;&#160;&quot;source&quot;: &quot;ctx._source.in_stock--&quot;<br />&#160;&#160;},<br />&#160;&#160;&quot;query&quot;: {<br />&#160;&#160;&#160;&#160;&quot;match_all&quot;: {}<br />&#160;&#160;}<br />}
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1590991555833" ID="5ucbad5niu4qec6cj65stkmdpm" MODIFIED="1590991555833" TEXT="Ignoring (counting) version conflicts">
<richcontent TYPE="NOTE"><html><head/><body><p>The `conflicts` key may be added as a query parameter instead, i.e. `?conflicts=proceed`.<br/><br/>POST /products/_update_by_query<br/>{<br/>&#xa0;&#xa0;"conflicts": "proceed",<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": "ctx._source.in_stock--"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7fi4o5bhasalb3cltmt2jg4k7m" MODIFIED="1590991555833" TEXT="Matches all of the documents within the `products` index">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /products/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="7fvaeukm0e8akg6p0hl9ji4up7" MODIFIED="1590991555833" TEXT="updating documents">
<node CREATED="1590991555833" ID="1iub6qbpc39hv92lh57787l5ee" MODIFIED="1590997971559" TEXT="Updating an existing field">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <span style="color: #ff0303"><font color="#ff0303">note that there is no need to add /_doc to this endpoint</font></span>
    </p>
    <p>
      
    </p>
    <p>
      POST /products/_update/100<br />{<br />&#160;&#160;&quot;doc&quot;: {<br />&#160;&#160;&#160;&#160;&quot;in_stock&quot;: 3<br />&#160;&#160;}<br />}
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1590991555833" ID="2itodrvl334c21em0940nuubkt" MODIFIED="1590991555833" TEXT="Adding a new field">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/100<br/>{<br/>&#xa0;&#xa0;"doc": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"tags": ["electronics"]<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="6vod53qpkg3rg78m5ccoocud9s" MODIFIED="1590991555833" TEXT="upserts">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /products/_update/101<br/>{<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": "ctx._source.in_stock++"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"upsert": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "Blender",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"price": 399,<br/>&#xa0;&#xa0;&#xa0;&#xa0;"in_stock": 5<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="7r7bminvktbt2897i797da0ni1" MODIFIED="1590991555833" POSITION="right" TEXT="4_5_Mapping &amp; Analysis">
<node CREATED="1590991555833" ID="53083l14lpao1mtdap368gimo7" MODIFIED="1590991555833" TEXT="adding analyzers to existing indices">
<node CREATED="1590991555833" ID="13jhh4f00cv05q4edun8m64ds3" MODIFIED="1590991555833" TEXT="Close `analyzer_test` index">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /analyzer_test/_close<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7ng25lgsjcftahmmrc0b3fn8cc" MODIFIED="1590991555833" TEXT="Add new analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /analyzer_test/_settings<br/>{<br/>&#xa0;&#xa0;"analysis": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"my_second_analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "custom",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stop",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"asciifolding"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="41nbsba0oe5pdefk60vovsti8s" MODIFIED="1590991555833" TEXT="Open `analyzer_test` index">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /analyzer_test/_open<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3j0idhib4teo00i12tth4pl20q" MODIFIED="1590991555833" TEXT="Retrieve index settings">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /analyzer_test/_settings<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="1p8kkgf8q2geo9d1g63r6d3at2" MODIFIED="1590991555833" TEXT="adding explicit mappings">
<node CREATED="1590991555833" ID="52t1ik03ps7o1s3phqugpt37o1" MODIFIED="1590991555833" TEXT="Add field mappings for `reviews` index">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"rating": { "type": "float" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"content": { "type": "text" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"product_id": { "type": "integer" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"author": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"first_name": { "type": "text" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"last_name": { "type": "text" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"email": { "type": "keyword" }<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
<node CREATED="1590991555833" ID="45jh3vci6vvdji29k8n94dv3pi" MODIFIED="1590991555833" TEXT=" Index a test document">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews/_doc/1<br/>{<br/>&#xa0;&#xa0;"rating": 5.0,<br/>&#xa0;&#xa0;"content": "Outstanding course! Bo really taught me a lot about Elasticsearch!",<br/>&#xa0;&#xa0;"product_id": 123,<br/>&#xa0;&#xa0;"author": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"first_name": "John",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"last_name": "Doe",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"email": "johndoe123@example.com"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="521f03bm3lhsfee59entkea8p9" MODIFIED="1590991555833" TEXT="adding mappings to existing indices">
<node CREATED="1590991555833" ID="6n45gcv35t35ijcd52adhkpdss" MODIFIED="1590991555833" TEXT="Add new field mapping to existing index">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews/_mapping<br/>{<br/>&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"created_at": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "date"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0pcbo3spsuq28h7ai83dpcmvam" MODIFIED="1590991555833" TEXT="Retrieve the mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews/_mapping<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="2tk6bouj9kebn4nnlto5o2s2ll" MODIFIED="1590991555833" TEXT="combining explicit and dynamic mapping">
<node CREATED="1590991555833" ID="3jtdqck00vbhb0k0etesgcok7d" MODIFIED="1590991555833" TEXT="Create index with one field mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /people<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"first_name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="44hp5rstql104or2onm3lich38" MODIFIED="1590991555833" TEXT="Index a test document with an unmapped field">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /people/_doc<br/>{<br/>&#xa0;&#xa0;"first_name": "Bo",<br/>&#xa0;&#xa0;"last_name": "Andersen"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2rvnkprs3q1es5mli2ti7jmqk1" MODIFIED="1590991555833" TEXT="Retrieve mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /people/_mapping</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="06dm5bj6dfk54jadmnvulnsnpo" MODIFIED="1590991555833" TEXT="Clean up">
<richcontent TYPE="NOTE"><html><head/><body><p>DELETE /people<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0s35g955jevfp63uifub1a2nt7" MODIFIED="1590991555833" TEXT="configuring dynamic mapping">
<node CREATED="1590991555833" ID="387g4c1qrqa9sdev04feibqjnb" MODIFIED="1590991555833" TEXT="Disable dynamic mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /people<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic": false,<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"first_name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2gmjfogbscqs2id2cjj743p6ps" MODIFIED="1590991555833" TEXT="Set dynamic mapping to `strict`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /people<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic": "strict",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"first_name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="666jgragrvi0oab9lbkir1732u" MODIFIED="1590991555833" TEXT="Index a test document">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /people/_doc<br/>{<br/>&#xa0;&#xa0;"first_name": "Bo",<br/>&#xa0;&#xa0;"last_name": "Andersen"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="56cdcs97d9sthirs4u2nv6m9ge" MODIFIED="1590991555833" TEXT="Retrieve mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /people/_mapping<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3j61quf41jp1ntqacmi028c6hp" MODIFIED="1590991555833" TEXT="Search `first_name` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /people/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"first_name": "Bo"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="34o70tljg1grv4thmb64kqh0ea" MODIFIED="1590991555833" TEXT="Search `last_name` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /people/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"last_name": "Andersen"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="63jkam2b9jjjrgn2qlkolloqcl" MODIFIED="1590991555833" TEXT="Clean up">
<richcontent TYPE="NOTE"><html><head/><body><p>DELETE /people<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="4m0o68o0tshkkmp9676jov2pjl" MODIFIED="1590991555833" TEXT="creating custom analyzers">
<node CREATED="1590991555833" ID="705cn4hb8elhluplg9a66huhph" MODIFIED="1590991555833" TEXT="Remove HTML tags and convert HTML entities">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;"text": "I&amp;apos;m in a &lt;em&gt;good&lt;/em&gt; mood&amp;nbsp;-&amp;nbsp;and I &lt;strong&gt;love&lt;/strong&gt; a&#xe7;a&#xed;!"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="21qddqv63rc4jc3k30f9v14cp4" MODIFIED="1590991555833" TEXT="Add the `standard` tokenizer">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;"text": "I&amp;apos;m in a &lt;em&gt;good&lt;/em&gt; mood&amp;nbsp;-&amp;nbsp;and I &lt;strong&gt;love&lt;/strong&gt; a&#xe7;a&#xed;!"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1lfdlsogg1b2vf4if9dqrbokfg" MODIFIED="1590991555833" TEXT="Add the `lowercase` token filter">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;"lowercase"<br/>&#xa0;&#xa0;],<br/>&#xa0;&#xa0;"text": "I&amp;apos;m in a &lt;em&gt;good&lt;/em&gt; mood&amp;nbsp;-&amp;nbsp;and I &lt;strong&gt;love&lt;/strong&gt; a&#xe7;a&#xed;!"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1p5124as2i0on2cpdgpdf9ndrs" MODIFIED="1590991555833" TEXT="Add the `stop` token filter">
<richcontent TYPE="NOTE"><html><head/><body><p>This removes English stop words by default.<br/><br/>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"stop"<br/>&#xa0;&#xa0;],<br/>&#xa0;&#xa0;"text": "I&amp;apos;m in a &lt;em&gt;good&lt;/em&gt; mood&amp;nbsp;-&amp;nbsp;and I &lt;strong&gt;love&lt;/strong&gt; a&#xe7;a&#xed;!"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="105e7l4pmjvi2264n8b2rfm28m" MODIFIED="1590991555833" TEXT="Add the `asciifolding` token filter">
<richcontent TYPE="NOTE"><html><head/><body><p>Convert characters to their ASCII equivalent.<br/>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"stop",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"asciifolding"<br/>&#xa0;&#xa0;],<br/>&#xa0;&#xa0;"text": "I&amp;apos;m in a &lt;em&gt;good&lt;/em&gt; mood&amp;nbsp;-&amp;nbsp;and I &lt;strong&gt;love&lt;/strong&gt; a&#xe7;a&#xed;!"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6unq5v45a4algggr1qsqf1bqms" MODIFIED="1590991555833" TEXT="Create a custom analyzer named `my_custom_analyzer`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /analyzer_test<br/>{<br/>&#xa0;&#xa0;"settings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"analysis": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"my_custom_analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "custom",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stop",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"asciifolding"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2fg0ob1v3uell58401pvt76rpu" MODIFIED="1590991555833" TEXT="Configure the analyzer to remove Danish stop words">
<richcontent TYPE="NOTE"><html><head/><body><p>To run this query, change the index name to avoid a conflict. Remember to remove the comments. :wink:<br/><br/>PUT /analyzer_test<br/>{<br/>&#xa0;&#xa0;"settings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"analysis": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"danish_stop": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "stop",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stopwords": "_danish_"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"char_filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;# Add character filters here<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;# Add tokenizers here<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"my_custom_analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "custom",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"danish_stop",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"asciifolding"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="60gtnq1ke8h3t5log8keikf91p" MODIFIED="1590991555833" TEXT="Test the custom analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /analyzer_test/_analyze<br/>{<br/>&#xa0;&#xa0;"analyzer": "my_custom_analyzer", <br/>&#xa0;&#xa0;"text": "I&amp;apos;m in a &lt;em&gt;good&lt;/em&gt; mood&amp;nbsp;-&amp;nbsp;and I &lt;strong&gt;love&lt;/strong&gt; a&#xe7;a&#xed;!"<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="4rg60ak9d28esosg911dmgoej5" MODIFIED="1590991555833" TEXT="defining field aliases">
<node CREATED="1590991555833" ID="2evbjfu41qeub4kaa9cb7bekv2" MODIFIED="1590993072719" TEXT="Add `comment` alias pointing to the `content` field">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      PUT /reviews/_mapping<br />{<br />&#160;&#160;&quot;properties&quot;: {<br />&#160;&#160;&#160;&#160;&quot;comment&quot;: {<br />&#160;&#160;&#160;&#160;&#160;&#160;&quot;type&quot;: &quot;alias&quot;,<br />&#160;&#160;&#160;&#160;&#160;&#160;&quot;path&quot;: &quot;content&quot;<br />&#160;&#160;&#160;&#160;}<br />&#160;&#160;}<br />}
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1590991555833" ID="3p9to7q4prbjc387r3e37h1vlk" MODIFIED="1590993197329" TEXT="Using the field alias">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      GET /reviews/_search<br />{<br />&#160;&#160;&quot;query&quot;: {<br />&#160;&#160;&#160;&#160;&quot;match&quot;: {<br />&#160;&#160;&#160;&#160;&#160;&#160;&quot;comment&quot;: &quot;outstanding&quot;<br />&#160;&#160;&#160;&#160;}<br />&#160;&#160;}<br />}
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1590991555833" ID="7ikt0emm734rv2bncm1cuh340p" MODIFIED="1590993059222" TEXT="Using the &quot;original&quot; field name still works">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      GET /reviews/_search<br />{<br />&#160;&#160;&quot;query&quot;: {<br />&#160;&#160;&#160;&#160;&quot;match&quot;: {<br />&#160;&#160;&#160;&#160;&#160;&#160;&quot;content&quot;: &quot;outstanding&quot;<br />&#160;&#160;&#160;&#160;}<br />&#160;&#160;}<br />}
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="38orcil4agkdg3ar2rqrgs8lub" MODIFIED="1590991555833" TEXT="dynamic templates">
<node CREATED="1590991555833" ID="12e2g6em58qk0gipg2fbmhungc" MODIFIED="1590991555833" TEXT="Map whole numbers to `integer` instead of `long`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /dynamic_template_test<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic_templates": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"integers": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_mapping_type": "long",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mapping": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "integer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="67g2ij1hkt6rhaj2kob2psb2hl" MODIFIED="1590991555833" TEXT="Test the dynamic template">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /dynamic_template_test/_doc<br/>{<br/>&#xa0;&#xa0;"in_stock": 123<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0osr855nsn5u579vouc77git46" MODIFIED="1590991555833" TEXT="Retrieve mapping (and dynamic template)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /dynamic_template_test/_mapping<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1bemfs81kvmnho32mhmejq2d8j" MODIFIED="1590991555833" TEXT="Modify default mapping for strings (set `ignore_above` to 512)">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /test_index<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic_templates": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"strings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_mapping_type": "string",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mapping": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fields": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"keyword": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ignore_above": 512<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4rqf1gn3s8hubt93fr1mrefsdi" MODIFIED="1590991555833" TEXT="Using `match` and `unmatch`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /test_index<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic_templates": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"strings_only_text": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_mapping_type": "string",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": "text_*",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"unmatch": "*_keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mapping": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"strings_only_keyword": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_mapping_type": "string",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": "*_keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mapping": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;}<br/>}<br/><br/>POST /test_index/_doc<br/>{<br/>&#xa0;&#xa0;"text_product_description": "A description.",<br/>&#xa0;&#xa0;"text_product_id_keyword": "ABC-123"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="35qk34nmm8d38dus99oj2cqfkm" MODIFIED="1590991555833" TEXT="Setting `match_pattern` to `regex`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /test_index<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic_templates": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"names": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_mapping_type": "string",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": "^[a-zA-Z]+_name$",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_pattern": "regex",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mapping": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;}<br/>}<br/><br/>POST /test_index/_doc<br/>{<br/>&#xa0;&#xa0;"first_name": "John",<br/>&#xa0;&#xa0;"middle_name": "Edward",<br/>&#xa0;&#xa0;"last_name": "Doe"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0iakqp196ieq94pd57c1bjscrv" MODIFIED="1590991555833" TEXT="Using `path_match`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /test_index<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic_templates": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"copy_to_full_name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_mapping_type": "string",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"path_match": "employer.name.*",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mapping": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"copy_to": "full_name"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;}<br/>}<br/><br/>POST /test_index/_doc<br/>{<br/>&#xa0;&#xa0;"employer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"first_name": "John",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"middle_name": "Edward",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"last_name": "Doe"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0rt982d6cn8hdfj7gtupkq2p0t" MODIFIED="1590991555833" TEXT="Using placeholders">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /test_index<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"dynamic_templates": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"no_doc_values": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_mapping_type": "*",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mapping": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "{dynamic_type}",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"index": false<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;}<br/>}<br/><br/>POST /test_index/_doc<br/>{<br/>&#xa0;&#xa0;"name": "John Doe",<br/>&#xa0;&#xa0;"age": 26<br/>}<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="1s0vkotouktf9d9ce1b3e55ll4" MODIFIED="1590991555833" TEXT="how dates work in elasticsearch">
<node CREATED="1590991555833" ID="4846lv6b7ubg947qrdapd7hqto" MODIFIED="1590991555833" TEXT="Supplying only a date">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews/_doc/2<br/>{<br/>&#xa0;&#xa0;"rating": 4.5,<br/>&#xa0;&#xa0;"content": "Not bad. Not bad at all!",<br/>&#xa0;&#xa0;"product_id": 123,<br/>&#xa0;&#xa0;"created_at": "2015-03-27",<br/>&#xa0;&#xa0;"author": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"first_name": "Average",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"last_name": "Joe",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"email": "avgjoe@example.com"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6p3jksnar0opooflf7nsjkb0bt" MODIFIED="1590991555833" TEXT="Supplying both a date and time">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews/_doc/3<br/>{<br/>&#xa0;&#xa0;"rating": 3.5,<br/>&#xa0;&#xa0;"content": "Could be better",<br/>&#xa0;&#xa0;"product_id": 123,<br/>&#xa0;&#xa0;"created_at": "2015-04-15T13:07:41Z",<br/>&#xa0;&#xa0;"author": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"first_name": "Spencer",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"last_name": "Pearson",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"email": "spearson@example.com"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1andjob3b9posucp3n9be30ebp" MODIFIED="1590991555833" TEXT=" Specifying the UTC offset">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews/_doc/4<br/>{<br/>&#xa0;&#xa0;"rating": 5.0,<br/>&#xa0;&#xa0;"content": "Incredible!",<br/>&#xa0;&#xa0;"product_id": 123,<br/>&#xa0;&#xa0;"created_at": "2015-01-28T09:21:51+01:00",<br/>&#xa0;&#xa0;"author": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"first_name": "Adam",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"last_name": "Jones",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"email": "adam.jones@example.com"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4hm1b5s3n1orgkfqpbgh3iau4k" MODIFIED="1590991555833" TEXT="Supplying a timestamp (milliseconds since the epoch)">
<richcontent TYPE="NOTE"><html><head/><body><p># Equivalent to 2015-07-04T12:01:24Z<br/>PUT /reviews/_doc/5<br/>{<br/>&#xa0;&#xa0;"rating": 4.5,<br/>&#xa0;&#xa0;"content": "Very useful",<br/>&#xa0;&#xa0;"product_id": 123,<br/>&#xa0;&#xa0;"created_at": 1436011284000,<br/>&#xa0;&#xa0;"author": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"first_name": "Taylor",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"last_name": "West",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"email": "twest@example.com"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6a5thk5v9v94oa20aojjmkrq1h" MODIFIED="1590991555833" TEXT="Retrieving documents">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="1b8f2qo18b6detdtpoc2p8b3b5" MODIFIED="1590991555833" TEXT="how the keyword data type works">
<node CREATED="1590991555833" ID="50h0i938s8o35m9o2mq53frvfa" MODIFIED="1590991555833" TEXT=" Testing the `keyword` analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"text": "2 guys walk into &#xa0;&#xa0;a bar, but the third... DUCKS! :-)",<br/>&#xa0;&#xa0;"analyzer": "keyword"<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="1h6q9evced7fgsveto6iid4l9p" MODIFIED="1590991555833" TEXT="index templates">
<node CREATED="1590991555833" ID="431r7423uifrunde3j8b316obd" MODIFIED="1590991555833" TEXT="Adding an index template named `access-logs`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /_template/access-logs<br/>{<br/>&#xa0;&#xa0;"index_patterns": ["access-logs-*"],<br/>&#xa0;&#xa0;"settings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"number_of_shards": 2,<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index.mapping.coerce": false<br/>&#xa0;&#xa0;}, <br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"@timestamp": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "date"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"url.original": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"http.request.referrer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"http.response.status_code": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "long"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2btq4jocsi0mecvd9tpus8cf33" MODIFIED="1590991555833" TEXT="Adding an index matching the index template&apos;s pattern">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /access-logs-2020-01-01<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7ju8msngvecejk4spg0bp4r3p4" MODIFIED="1590991555833" TEXT="Verify that the mapping is applied">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /access-logs-2020-01-01<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="49mouged1bc2mf98gr48va39v9" MODIFIED="1590991555833" TEXT="multi field mappings">
<node CREATED="1590991555833" ID="0j31j2fbilmmdonqun2tsf9koc" MODIFIED="1590991555833" TEXT="Add `keyword` mapping to a `text` field">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /multi_field_test<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fields": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"keyword": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="79p14qjp8c81fe3625b9nlncs5" MODIFIED="1590991555833" TEXT="Index a test document">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /multi_field_test/_doc<br/>{<br/>&#xa0;&#xa0;"description": "To make this spaghetti carbonara, you first need to...",<br/>&#xa0;&#xa0;"ingredients": ["Spaghetti", "Bacon", "Eggs"]<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="387me0vakjvkc9dr1c1qm62nrl" MODIFIED="1590991555833" TEXT="Retrieve documents">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /multi_field_test/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="097np3mnn5uteis2nkj7v72qc6" MODIFIED="1590991555833" TEXT="Querying the `text` mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /multi_field_test/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients": "Spaghetti"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0r07isupqpmc0ejugtqrcei8hp" MODIFIED="1590991555833" TEXT="Querying the `keyword` mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /multi_field_test/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.keyword": "Spaghetti"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="53atstuhqmk6bkhpbkkq6589te" MODIFIED="1590991555833" TEXT="Clean up">
<richcontent TYPE="NOTE"><html><head/><body><p>DELETE /multi_field_test<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="1v2civ0st2cfacq315j007le6n" MODIFIED="1590991555833" TEXT="reindexing documents with the reindex api">
<node CREATED="1590991555833" ID="3ti0dgnql1kasd1e11musaaslu" MODIFIED="1590991555833" TEXT="Add new index with new mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews_new<br/>{<br/>&#xa0;&#xa0;"mappings" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"author" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"properties" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"email" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ignore_above" : 256<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"first_name" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"last_name" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"content" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"created_at" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "date"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"product_id" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"rating" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "float"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="66j2538fn3tkpgqklcek02ev6c" MODIFIED="1590991555833" TEXT="Retrieve mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews/_mappings<br/>&#x9;</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3tt37f4299sicdimgbmjugo9hc" MODIFIED="1590991555833" TEXT="Reindex documents into `reviews_new`">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_reindex<br/>{<br/>&#xa0;&#xa0;"source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"dest": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews_new"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="374o0fptk9kqfdqqkrh1qefn7n" MODIFIED="1590991555833" TEXT="Delete all documents">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /reviews_new/_delete_by_query<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1kkpjals1hrlllgb29qn560gan" MODIFIED="1590991555833" TEXT="Convert `product_id` values to strings">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_reindex<br/>{<br/>&#xa0;&#xa0;"source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"dest": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews_new"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": """<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;if (ctx._source.product_id != null) {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx._source.product_id = ctx._source.product_id.toString();<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;"""<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2qcvgot7kt07tu88tv6ktecsc3" MODIFIED="1590991555833" TEXT="Retrieve documents">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews_new/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="39jvqerjn4dr3bl8bg6v6app79" MODIFIED="1590991555833" TEXT="Reindex specific documents">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_reindex<br/>{<br/>&#xa0;&#xa0;"source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_all": { }<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"dest": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews_new"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6dnb72cqahaa0dh1tfcfcf1pif" MODIFIED="1590991555833" TEXT="Reindex only positive reviews">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_reindex<br/>{<br/>&#xa0;&#xa0;"source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"rating": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 4.0<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"dest": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews_new"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5501e2edt9sue9pcf12hkifvja" MODIFIED="1590991555833" TEXT="Removing fields (source filtering)">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_reindex<br/>{<br/>&#xa0;&#xa0;"source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"_source": ["content", "created_at", "rating"]<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"dest": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews_new"<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0hk5j90tndq4ct78j3kcirqk8h" MODIFIED="1590991555833" TEXT=" Changing a field&apos;s name">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_reindex<br/>{<br/>&#xa0;&#xa0;"source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"dest": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews_new"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": """<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;# Rename "content" field to "comment"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx._source.comment = ctx._source.remove("content");<br/>&#xa0;&#xa0;&#xa0;&#xa0;"""<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0o3c81brckgre3eemeq5sr0qnr" MODIFIED="1590991555833" TEXT="Ignore reviews with ratings below 4.0">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_reindex<br/>{<br/>&#xa0;&#xa0;"source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"dest": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"index": "reviews_new"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"script": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"source": """<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;if (ctx._source.rating &lt; 4.0) {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;ctx.op = "noop"; # Can also be set to "delete"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;"""<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0492cu0ctcnmv2h7a07t0fnqdc" MODIFIED="1590991555833" TEXT="retrieving mappings">
<node CREATED="1590991555833" ID="7enhmppa0vh8rq5tjs0vs5ng9h" MODIFIED="1590991555833" TEXT="Retrieving mappings for the `reviews` index">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews/_mapping<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5tge4ln94nia7vus342o85bv0m" MODIFIED="1590991555833" TEXT="Retrieving mapping for the `content` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews/_mapping/field/content<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6nsnfdmndas1ks2mh52mbhtlj2" MODIFIED="1590991555833" TEXT="Retrieving mapping for the `author.email` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews/_mapping/field/author.email<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="213999550k5nsl1sarht7bge2i" MODIFIED="1590991555833" TEXT="understanding arrays">
<node CREATED="1590991555833" ID="43ge261d2308cbbinf8mjc4cia" MODIFIED="1590991555833" TEXT="Arrays of strings are concatenated when analyzed">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"text": ["Strings are simply", "merged together."],<br/>&#xa0;&#xa0;"analyzer": "standard"<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3ded6idnn8d047vt49tvcmd5sp" MODIFIED="1590991555833" TEXT="understanding type coercion">
<node CREATED="1590991555833" ID="77fa47iht6lkqp4gi5n64s8hvm" MODIFIED="1590991555833" TEXT="Supplying a floating point">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /coercion_test/_doc/1<br/>{<br/>&#xa0;&#xa0;"price": 7.4<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="31b25nfll4b15qij6pd0ofitrd" MODIFIED="1590991555833" TEXT="Supplying a floating point within a string">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /coercion_test/_doc/2<br/>{<br/>&#xa0;&#xa0;"price": "7.4"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="760m4s23s3t9dndnotkb0oeslm" MODIFIED="1590991555833" TEXT="Supplying an invalid value">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /coercion_test/_doc/3<br/>{<br/>&#xa0;&#xa0;"price": "7.4m"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4mf4vecrp3cugvphj69ker6rua" MODIFIED="1590991555833" TEXT="Retrieve document">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /coercion_test/_doc/2<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6mvrppa9pra8cumnaq2jujsi25" MODIFIED="1590991555833" TEXT="Clean up">
<richcontent TYPE="NOTE"><html><head/><body><p>DELETE /coercion_test<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="53hicrmvvtpf1p11p2ri8fs14s" MODIFIED="1590991555833" TEXT="updating analyzers">
<node CREATED="1590991555833" ID="54p9nca9taa7mbciipuehuq9lo" MODIFIED="1590991555833" TEXT="Add `description` mapping using `my_custom_analyzer`">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /analyzer_test/_mapping<br/>{<br/>&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"description": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": "my_custom_analyzer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5t53uhc1q6qtp9ro68drdohk40" MODIFIED="1590991555833" TEXT="Index a test document">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /analyzer_test/_doc<br/>{<br/>&#xa0;&#xa0;"description": "Is that Peter's cute-looking dog?"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5njk82svql0bc5rrl5j6sfg6bc" MODIFIED="1590991555833" TEXT="Search query using `keyword` analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /analyzer_test/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "that",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0mr2794eqfo8mpjiu3ovuhun81" MODIFIED="1590991555833" TEXT="Close `analyzer_test` index">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /analyzer_test/_close<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5aineaek283hhk5kg3d8bveudm" MODIFIED="1590991555833" TEXT="Update `my_custom_analyzer` (remove `stop` token filter)">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /analyzer_test/_settings<br/>{<br/>&#xa0;&#xa0;"analysis": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"my_custom_analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "custom",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"char_filter": ["html_strip"],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"asciifolding"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="57l56974f94g15qissgm9n6sde" MODIFIED="1590991555833" TEXT="Open `analyzer_test` index">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /analyzer_test/_open<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0lo7r8c8f62f30jp2qnv7v50kh" MODIFIED="1590991555833" TEXT="Retrieve index settings">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /analyzer_test/_settings<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3ah45qkim7vvsc1rhannq1naek" MODIFIED="1590991555833" TEXT="Reindex documents">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /analyzer_test/_update_by_query?conflicts=proceed</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3entes4l2g4jrvgro8lk6avsmq" MODIFIED="1590991555833" TEXT="updating existing mappings">
<node CREATED="1590991555833" ID="3k3npa1311dbpdpt778khmrbgi" MODIFIED="1590991555833" TEXT="Generally, field mappings cannot be updated">
<richcontent TYPE="NOTE"><html><head/><body><p>This query won't work.<br/>PUT /reviews/_mapping<br/>{<br/>&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"product_id": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3srja3bts6m7olqn09s7mufo07" MODIFIED="1590991555833" TEXT="Some mapping parameters can be changed">
<richcontent TYPE="NOTE"><html><head/><body><p>The `ignore_above` mapping parameter _can_ be updated, for instance.<br/><br/>PUT /reviews/_mapping<br/>{<br/>&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"author": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"email": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ignore_above": 256<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="771tfja9ubjubfdgfa67mcuu4d" MODIFIED="1590991555833" TEXT="using dot notation in field names">
<node CREATED="1590991555833" ID="581s189f6avudei99snk4p3rs5" MODIFIED="1590991555833" TEXT="Using dot notation for the `author` object">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /reviews_dot_notation<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"rating": { "type": "float" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"content": { "type": "text" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"product_id": { "type": "integer" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"author.first_name": { "type": "text" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"author.last_name": { "type": "text" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"author.email": { "type": "keyword" }<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5107jpu0bak0bh61uci90bfsrm" MODIFIED="1590991555833" TEXT="Retrieve mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /reviews_dot_notation/_mapping<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="02ohta4u1acjc0ienmol0iua38" MODIFIED="1590991555833" TEXT="using the analyze api">
<node CREATED="1590991555833" ID="4jbpjpn9jts0ju97qe7e2b3u5o" MODIFIED="1590991555833" TEXT="Analyzing a string with the `standard` analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"text": "2 guys walk into &#xa0;&#xa0;a bar, but the third... DUCKS! :-)",<br/>&#xa0;&#xa0;"analyzer": "standard"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2jr14smmnvtcppr67tu4dint6p" MODIFIED="1590991555833" TEXT="Building the equivalent of the `standard` analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /_analyze<br/>{<br/>&#xa0;&#xa0;"text": "2 guys walk into &#xa0;&#xa0;a bar, but the third... DUCKS! :-)",<br/>&#xa0;&#xa0;"char_filter": [],<br/>&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;"filter": ["lowercase"]<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="29esq1acioo77p8345oc4s1dh2" MODIFIED="1590991555833" POSITION="right" TEXT="6_Introduction to Searching">
<node CREATED="1590991555833" ID="3qdc9njssdkc8diotav1duf6p2" MODIFIED="1590991555833" TEXT="debugging unexpected query results">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_doc/1/_explain<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "lobster"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="78cloqij84hr1j91c6b5sodmv9" MODIFIED="1590991555833" TEXT="full text queries vs term level queries">
<node CREATED="1590991555833" ID="5r1q6gb323k0lk6qhjsdpaenir" MODIFIED="1590991555833" TEXT="Term level queries are not analyzed">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "lobster"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Lobster"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6qah0tnl6fbg5q0pcr8dj5gl0l" MODIFIED="1590991555833" TEXT="Full-text queries are analyzed">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Lobster"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="13n81q89ijm0m5rk6hm9b6449e" MODIFIED="1590991555833" TEXT="introducing the query dsl">
<node CREATED="1590991555833" ID="0gacu78lefoubcn8n0sjfo09fi" MODIFIED="1590991555833" TEXT="Matching all documents">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="6bbbs5na9iqclgj6mcm7531ohs" MODIFIED="1590991555833" TEXT="searching with the request uri">
<node CREATED="1590991555833" ID="3etg5qok601ggcqsf97usu8vn4" MODIFIED="1590991555833" TEXT="Matching all documents">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search?q=*<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1pr7cadpock9ecp2i9t5bvrthc" MODIFIED="1590991555833" TEXT="Matching documents containing the term `Lobster`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search?q=name:Lobster<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6ajua90eusl11p02qmdjbo41e5" MODIFIED="1590991555833" TEXT="Matching documents containing the tag `Meat`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search?q=tags:Meat<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5lmu9i3dj0a2e46i9t663d8j8m" MODIFIED="1590991555833" TEXT="Matching documents containing the tag `Meat` _and_ name `Tuna`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search?q=tags:Meat AND name:Tuna<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3qi1l6empihd2mm5u3fn4nerrk" MODIFIED="1590991555833" TEXT="understanding relevance scores">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"explain": true,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "lobster"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="5sgqeltbfu5iep8fkjus0q9ct6" MODIFIED="1590991555833" POSITION="right" TEXT="7_Term Level Queries">
<node CREATED="1590991555833" ID="7ubphso2v4v4ifm77r5jbva9gp" MODIFIED="1590991555833" TEXT="exercises">
<node CREATED="1590991555833" ID="66nt04k9b4ne2585u42q3q3u8m" MODIFIED="1590991555833" TEXT="Matching documents with a `sold` field of less than `10`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"sold": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lt": 10<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="651p1tc8uedlfskcatvl0asb3m" MODIFIED="1590991555833" TEXT="Matching documents with a `sold` field between `10` (inclusive) and `30` (exclusive)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"sold": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lt": 30,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 10<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2983e8lhpr9791bfggc3f3f4k0" MODIFIED="1590991555833" TEXT="Matching documents containing the tag `Meat`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tags.keyword": "Meat"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0agjhdq20ipv45e19359vc2r8h" MODIFIED="1590991555833" TEXT="Matching documents containing `Tomato` or `Paste` within the `name` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": [ "Tomato", "Paste" ]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="18n8ub5pder8j29afcmi3ku729" MODIFIED="1590991555833" TEXT="Matching documents containing `past` followed by an optional character, for the `name` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"wildcard": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "past?"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2cderf7ej80a647knsaof6ili9" MODIFIED="1590991555833" TEXT="Matching documents containing a number within the `name` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"regexp": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "[0-9]+"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="54pm714v5jur431i25etlvh18h" MODIFIED="1590991555833" TEXT="matching based on prefixes">
<node CREATED="1590991555833" ID="0cjtcfnl5e70tbc1r9nbfjo330" MODIFIED="1590991555833" TEXT="Matching documents containing a tag beginning with `Vege`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"prefix": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tags.keyword": "Vege"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="31bksn91uvga54cf5vj44mpm22" MODIFIED="1590991555833" TEXT="matching documents with non null values">
<node CREATED="1590991555833" ID="4k6g7oci0v0qbvfsck174tp4kc" MODIFIED="1590991555833" TEXT="Matching documents with non-null values">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"exists": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "tags"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="596rcdrk7mvf6hkbt7s73se7ts" MODIFIED="1590991555833" TEXT="matching documents with range values">
<node CREATED="1590991555833" ID="41k6sei056tqd893ks6lssbl6q" MODIFIED="1590991555833" TEXT="Matching documents with an `in_stock` field of between `1` and `5`, both included">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"in_stock": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 1,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": 5<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3ndk0iup06m4tko92loadp5235" MODIFIED="1590991555833" TEXT="Matching documents with a date range">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"created": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": "2010/01/01",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": "2010/12/31"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4igka90mp6iddqbh3qmuhj69b0" MODIFIED="1590991555833" TEXT="Matching documents with a date range and custom date format">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"created": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": "01-01-2010",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": "31-12-2010",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"format": "dd-MM-yyyy"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="5j210mgvpsvpnh2ke3s4vph6n2" MODIFIED="1590991555833" TEXT="retrieving documents based on ids">
<node CREATED="1590991555833" ID="62u35va4p8its4v7l2530n6hoq" MODIFIED="1590991555833" TEXT="Retrieving documents based on IDs">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"ids": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"values": [ 1, 2, 3 ]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0kmsfao3v789klp1f2ku2opo7l" MODIFIED="1590991555833" TEXT="searching for a term">
<node CREATED="1590991555833" ID="0i2thun94avu0k4jdorhkd56pa" MODIFIED="1590991555833" TEXT="Matching documents with a value of `true` for the `is_active` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"is_active": true<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"is_active": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"value": true<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="59olqrspfo4a17rmh48hadsvf4" MODIFIED="1590991555833" TEXT="searching for multiple terms">
<node CREATED="1590991555833" ID="4q6c7dfcrn89et332c9kcn289v" MODIFIED="1590991555833" TEXT="Searching for multiple terms">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tags.keyword": [ "Soup", "Cake" ]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="5qnpf7s903sstgk1tchi58jo1a" MODIFIED="1590991555833" TEXT="searching with regular expressions">
<node CREATED="1590991555833" ID="18ps6acjqj8s5unr3j81h5j26a" MODIFIED="1590991555833" TEXT="Searching with regular expressions">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"regexp": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tags.keyword": "Veg[a-zA-Z]+ble"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="2rrv45cfrhnnfr2rig53b0d78s" MODIFIED="1590991555833" TEXT="searching with wildcards">
<node CREATED="1590991555833" ID="0so6b6bvfk9gv9q5s5d43asmfl" MODIFIED="1590991555833" TEXT="Adding an asterisk for any characters (zero or more)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"wildcard": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tags.keyword": "Veg*ble"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4jr8eo24euq7cdkqhn01ujnl9c" MODIFIED="1590991555833" TEXT="Adding a question mark for any single character">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"wildcard": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tags.keyword": "Veg?ble"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"wildcard": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tags.keyword": "Veget?ble"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0laplmdjovmr77nspi5annqdo6" MODIFIED="1590991555833" TEXT="working with relative dates">
<node CREATED="1590991555833" ID="66jte6ifo1j7kntqjalqf1mcso" MODIFIED="1590991555833" TEXT="Subtracting one year from `2010/01/01`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"created": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": "2010/01/01||-1y"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5kmd67osfff93p1jne06d61boc" MODIFIED="1590991555833" TEXT="Subtracting one year and one day from `2010/01/01`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"created": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": "2010/01/01||-1y-1d"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7vr6iplmjtbj5cec9cn4mfnc34" MODIFIED="1590991555833" TEXT="Subtracting one year from `2010/01/01` and rounding by month">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"created": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": "2010/01/01||-1y/M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0jmco8cihpk5p4v97ehc751f3l" MODIFIED="1590991555833" TEXT="Rounding by month _before_ subtracting one year from `2010/01/01`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"created": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": "2010/01/01||/M-1y"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4dip3engpq05fsp9ms8in31t86" MODIFIED="1590994576062" TEXT="Rounding by month _before_ subtracting one year from the current date">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font color="#ff3300">note that there is no pipe need</font>
    </p>
    <p>
      
    </p>
    <p>
      GET /product/_search<br />{<br />&#160;&#160;&quot;query&quot;: {<br />&#160;&#160;&#160;&#160;&quot;range&quot;: {<br />&#160;&#160;&#160;&#160;&#160;&#160;&quot;created&quot;: {<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&quot;gte&quot;: &quot;now/M-1y&quot;<br />&#160;&#160;&#160;&#160;&#160;&#160;}<br />&#160;&#160;&#160;&#160;}<br />&#160;&#160;}<br />}
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1590991555833" ID="6p5u57ij9h1v7pukee50ginuul" MODIFIED="1590994954872" TEXT="Matching documents with a `created` field containing the current date or later">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font color="#ff3300">note that now is a string</font>
    </p>
    <p>
      GET /product/_search<br />{<br />&#160;&#160;&quot;query&quot;: {<br />&#160;&#160;&#160;&#160;&quot;range&quot;: {<br />&#160;&#160;&#160;&#160;&#160;&#160;&quot;created&quot;: {<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&quot;gte&quot;: &quot;now&quot;<br />&#160;&#160;&#160;&#160;&#160;&#160;}<br />&#160;&#160;&#160;&#160;}<br />&#160;&#160;}<br />}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="6529f3dc2kkmkhq3ctsh89qf4g" MODIFIED="1590991555833" POSITION="right" TEXT="8_Full Text Queries">
<node CREATED="1590991555833" ID="15sr3v3q41ouqjm109u8f9bv4b" MODIFIED="1590991555833" TEXT="exercises">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "Pasta with parmesan and spinach"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta carbonara"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "carbonara pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"multi_match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "pasta pesto",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fields": [ "title", "description" ]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5res5914pl2ps110jkabfr4h77" MODIFIED="1590991555833" TEXT="flexible matching with match query">
<node CREATED="1590991555833" ID="68ehkd82oknbhrlqovvfi221bs" MODIFIED="1590991555833" TEXT="Standard `match` query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "Recipes with pasta or spaghetti"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3kicsj11oblj0nv7qlad61etr8" MODIFIED="1590991555833" TEXT="Specifying a boolean operator">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "Recipes with pasta or spaghetti",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"operator": "and"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "pasta or spaghetti",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"operator": "and"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "pasta spaghetti",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"operator": "and"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="7hhganooht7nhro3qb033qop69" MODIFIED="1590991555833" TEXT="introduction to full text queries">
<node CREATED="1590991555833" ID="5ttev2k79j8hv4cupg5ud4jbma" MODIFIED="1590991555833" TEXT="Importing new test data">
<richcontent TYPE="NOTE"><html><head/><body><p>cd /path/to/data/file/directory<br/><br/><br/>shell<br/>curl -H "Content-Type: application/x-ndjson" -XPOST "http://localhost:9200/recipe/_bulk?pretty" --data-binary "@recipes-bulk.json"</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5as334ulk29pvpbjri6k016bk9" MODIFIED="1590991555833" TEXT="Inspecting the mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_mapping<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0d2usio9e24v60bovo9okedbpc" MODIFIED="1590991555833" TEXT="matching phrases">
<node CREATED="1590991555833" ID="7e3lhv6r3glgved2l6ivhhjg11" MODIFIED="1590991555833" TEXT="The order of terms matters">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "puttanesca spaghetti"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "puttanesca spaghetti"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="6odbhap8ig7pnps65jbloldhqg" MODIFIED="1590991555833" TEXT="searching multiple fields">
<node CREATED="1590991555833" ID="4epj4em7dm8qev2e513r81hbuv" MODIFIED="1590991555833" TEXT="Searching multiple fields">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"multi_match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "pasta",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fields": [ "title", "description" ]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="40pq12na0r7hfqpjgikhb6m9ms" MODIFIED="1590991555833" POSITION="left" TEXT="9_Adding Boolean Logic to Queries">
<node CREATED="1590991555833" ID="0do8jbqq6qpudate4oka5mqimv" MODIFIED="1590991555833" TEXT="debugging bool queries with named queries">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "parmesan",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"_name": "parmesan_must"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must_not": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "tuna",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"_name": "tuna_must_not"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "parsley",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"_name": "parsley_should"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"preparation_time_minutes": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": 15,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"_name": "prep_time_filter"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0fn4tebseuc3v2081ihdnvrr7b" MODIFIED="1590991555833" TEXT="how the match query works">
<node CREATED="1590991555833" ID="02cu393dl472h331i3o20j7lhg" MODIFIED="1590991555833" TEXT="The two queries below are equivalent">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta carbonara"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "carbonara"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7mkdhs7m1de7qbi96u9jjem6gv" MODIFIED="1590991555833" TEXT="The two queries below are equivalent">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "pasta carbonara",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"operator": "and"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "carbonara"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="21rhi7h3teom3t8pmo3bga0uni" MODIFIED="1590991555833" TEXT="querying with boolean logic">
<node CREATED="1590991555833" ID="0aop91tkfla16elk3ehcbsd9v2" MODIFIED="1590991555833" TEXT="Adding query clauses to the `must` key">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "parmesan"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"preparation_time_minutes": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": 15<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3sn6gqcfq4v147gp8bjcddif9o" MODIFIED="1590991555833" TEXT=" Moving the `range` query to the `filter` key">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "parmesan"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"preparation_time_minutes": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": 15<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0lmnpr482joc9kndk6rmr4h92q" MODIFIED="1590991555833" TEXT="Adding a query clause to the `must_not` key">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "parmesan"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must_not": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "tuna"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"preparation_time_minutes": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": 15<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4e6318mo0fo41o51rl48igkovp" MODIFIED="1590991555833" TEXT="Adding a query clause to the `should` key">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "parmesan"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must_not": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "tuna"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "parsley"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"preparation_time_minutes": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": 15<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1gbm6b7cuefhnrms6tl84c0635" MODIFIED="1590991555833" TEXT="The behavior of `should` query clauses depends">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "parmesan"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ingredients.name": "parmesan"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="5vg6r7eoub9km8bov8o585knrb" MODIFIED="1590991555833" POSITION="left" TEXT="10_Joining Queries">
<node CREATED="1590991555833" ID="6eooghlelpaekqsjkc0uoq8inf" MODIFIED="1590991555833" TEXT="adding documents">
<node CREATED="1590991555833" ID="5p0jpkf90e9l192c6ov6de3fcn" MODIFIED="1590991555833" TEXT="Adding departments">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /department/_doc/1<br/>{<br/>&#xa0;&#xa0;"name": "Development",<br/>&#xa0;&#xa0;"join_field": "department"<br/>}<br/><br/>PUT /department/_doc/2<br/>{<br/>&#xa0;&#xa0;"name": "Marketing",<br/>&#xa0;&#xa0;"join_field": "department"<br/>}<br/><br/><br/><br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="46u9s1frkgsp16ad0q08ka35kl" MODIFIED="1590991555833" TEXT="Adding employees for departments">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /department/_doc/3?routing=1<br/>{<br/>&#xa0;&#xa0;"name": "Bo Andersen",<br/>&#xa0;&#xa0;"age": 28,<br/>&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 1<br/>&#xa0;&#xa0;}<br/>}<br/><br/>PUT /department/_doc/4?routing=2<br/>{<br/>&#xa0;&#xa0;"name": "John Doe",<br/>&#xa0;&#xa0;"age": 44,<br/>&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 2<br/>&#xa0;&#xa0;}<br/>}<br/><br/>PUT /department/_doc/5?routing=1<br/>{<br/>&#xa0;&#xa0;"name": "James Evans",<br/>&#xa0;&#xa0;"age": 32,<br/>&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 1<br/>&#xa0;&#xa0;}<br/>}<br/><br/>PUT /department/_doc/6?routing=1<br/>{<br/>&#xa0;&#xa0;"name": "Daniel Harris",<br/>&#xa0;&#xa0;"age": 52,<br/>&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 1<br/>&#xa0;&#xa0;}<br/>}<br/><br/>PUT /department/_doc/7?routing=2<br/>{<br/>&#xa0;&#xa0;"name": "Jane Park",<br/>&#xa0;&#xa0;"age": 23,<br/>&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 2<br/>&#xa0;&#xa0;}<br/>}<br/><br/>PUT /department/_doc/8?routing=1<br/>{<br/>&#xa0;&#xa0;"name": "Christina Parker",<br/>&#xa0;&#xa0;"age": 29,<br/>&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 1<br/>&#xa0;&#xa0;}<br/>}<br/><br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="4gabipeja8plqimho2nquq5en2" MODIFIED="1590991555833" TEXT="mapping document relationships">
<node CREATED="1590991555833" ID="7e99v4g2j92h2m2m7jh704be19" MODIFIED="1590991555833" TEXT=" Mapping document relationships">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /department<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"join_field": { <br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "join",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"relations": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"department": "employee"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="7ql0qqn8428jgukgn5m8dg6a64" MODIFIED="1590991555833" TEXT="multi level relations">
<node CREATED="1590991555833" ID="7bei7jc2efdbirk8qduckeo7fu" MODIFIED="1590991555833" TEXT="Creating the index with mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /company<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"join_field": { <br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "join",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"relations": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"company": ["department", "supplier"],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"department": "employee"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7vf63d38ubqci381cqqc8u74ru" MODIFIED="1590991555833" TEXT="Adding a company">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /company/_doc/1<br/>{<br/>&#xa0;&#xa0;"name": "My Company Inc.",<br/>&#xa0;&#xa0;"join_field": "company"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2k024ch3oh6b8emkutii61d026" MODIFIED="1590991555833" TEXT="Adding a department">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /company/_doc/2?routing=1<br/>{<br/>&#xa0;&#xa0;"name": "Development",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "department",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 1<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="158f9vu54o8srku61cbmujs09f" MODIFIED="1590991555833" TEXT="Adding an employee">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /company/_doc/3?routing=1<br/>{<br/>&#xa0;&#xa0;"name": "Bo Andersen",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 2<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2tlnnbrnuaq9171oc2k76sahc4" MODIFIED="1590991555833" TEXT="Adding some more test data">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /company/_doc/4<br/>{<br/>&#xa0;&#xa0;"name": "Another Company, Inc.",<br/>&#xa0;&#xa0;"join_field": "company"<br/>}<br/><br/><br/><br/>PUT /company/_doc/5?routing=4<br/>{<br/>&#xa0;&#xa0;"name": "Marketing",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "department",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 4<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/><br/>PUT /company/_doc/6?routing=4<br/>{<br/>&#xa0;&#xa0;"name": "John Doe",<br/>&#xa0;&#xa0;"join_field": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"name": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent": 5<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3tv8o0i5r3lq2nmamdgcipj5m1" MODIFIED="1590991555833" TEXT="Example of querying multi-level relations">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /company/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_child": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "department",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"has_child": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name.keyword": "John Doe"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="1ovrlsnljnvklmro9iki8dooss" MODIFIED="1590991555833" TEXT="nested inner hits">
<node CREATED="1590991555833" ID="62050m9bhttn68655vjrc5j89i" MODIFIED="1590991555833" TEXT="Nested inner hits">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"nested": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"path": "employees",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"inner_hits": {},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"employees.position": "intern"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"employees.gender.keyword": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"value": "F"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="4kb8hh4sll77v21sc9dl2uh7u7" MODIFIED="1590991555833" TEXT="parent child inner hits">
<node CREATED="1590991555833" ID="46hsi6bum2ljk8au7achga0k3h" MODIFIED="1590991555833" TEXT="Including inner hits for the `has_child` query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_child": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"inner_hits": {},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 50<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender.keyword": "M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="76u0c1j0tjtmnqb5c46u64ee2h" MODIFIED="1590991555833" TEXT="Including inner hits for the `has_parent` query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_parent": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"inner_hits": {},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"parent_type": "department",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name.keyword": "Development"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0r2o0eqc24dmjpj3agf2snp2mj" MODIFIED="1590991555833" TEXT="querying by parent id">
<node CREATED="1590991555833" ID="542nr3q7jedhrbtnv1qisv51nv" MODIFIED="1590991555833" TEXT="Querying by parent">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"parent_id": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"id": 1<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="40t80ci4gu0rti0nh74fsc6ehf" MODIFIED="1590991555833" TEXT="querying child documents by parent">
<node CREATED="1590991555833" ID="2fdi3qkeg3dtshjcg1fcvk7jfv" MODIFIED="1590991555833" TEXT="Matching child documents by parent criteria">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_parent": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"parent_type": "department",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name.keyword": "Development"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="51rh9sgud923onnqmrrsn73vnt" MODIFIED="1590991555833" TEXT="Incorporating the parent documents&apos; relevance scores">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_parent": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"parent_type": "department",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"score": true,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name.keyword": "Development"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="1vnsq41e3htian5e3jfs6q3rfu" MODIFIED="1590991555833" TEXT="querying nested objects">
<node CREATED="1590991555833" ID="17gg06b0j7us5m9c5uvct3m5f4" MODIFIED="1590991555833" TEXT="Creating the index with mapping">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /department<br/>{<br/>&#xa0;&#xa0;"mappings": { &#xa0;<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"employees": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "nested"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="17348ec587rb69dr1a4bpm20p9" MODIFIED="1590991555833" TEXT="Adding test documents">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /department/_doc/1<br/>{<br/>&#xa0;&#xa0;"name": "Development",<br/>&#xa0;&#xa0;"employees": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Eric Green",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 39,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Big Data Specialist"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "James Taylor",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 27,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Software Developer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Gary Jenkins",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 21,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Intern"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Julie Powell",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 26,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Intern"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Benjamin Smith",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 46,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Senior Software Engineer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;]<br/>}<br/><br/><br/>PUT /department/_doc/2<br/>{<br/>&#xa0;&#xa0;"name": "HR &amp; Marketing",<br/>&#xa0;&#xa0;"employees": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Patricia Lewis",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 42,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Senior Marketing Manager"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Maria Anderson",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 56,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Head of HR"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Margaret Harris",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 19,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Intern"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Ryan Nelson",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 31,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Marketing Manager"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Kathy Williams",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 49,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Senior Marketing Manager"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Jacqueline Hill",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 28,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Junior Marketing Manager"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Donald Morris",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 39,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "SEO Specialist"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Evelyn Henderson",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 24,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "F",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Intern"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Earl Moore",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 21,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "Junior SEO Specialist"<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": "Phillip Sanchez",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": 35,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender": "M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"position": "SEM Specialist"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;]<br/>}<br/><br/><br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5t2ttrint5164t8d42bss24ga6" MODIFIED="1590991555833" TEXT="Querying nested fields">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"nested": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"path": "employees",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"employees.position": "intern"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"employees.gender.keyword": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"value": "F"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="05iiv1dt26eeps5ap282qfh9l0" MODIFIED="1590991555833" TEXT="querying parent by child documents">
<node CREATED="1590991555833" ID="263mtsd3rkicrembu1rnmm5dds" MODIFIED="1590991555833" TEXT="Finding parents with child documents matching a `bool` query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_child": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 50<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender.keyword": "M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="022qj5ha42ogqfbdddpjloi1go" MODIFIED="1590991555833" TEXT="Taking relevance scores into account with `score_mode`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_child": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"score_mode": "sum",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 50<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender.keyword": "M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7k40e0v64p48udoc4g28s2prpb" MODIFIED="1590991555833" TEXT="Specifying the minimum and maximum number of children">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"has_child": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "employee",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"score_mode": "sum",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min_children": 2,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"max_children": 5,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"age": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 50<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"term": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gender.keyword": "M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="2e5n1rh7aoqqpg0e33mpa53kjv" MODIFIED="1590991555833" TEXT="terms lookup mechanism">
<node CREATED="1590991555833" ID="0d9papl2kch9s1q084oprgqc89" MODIFIED="1590991555833" TEXT="Adding test data">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /users/_doc/1<br/>{<br/>&#xa0;&#xa0;"name": "John Roberts",<br/>&#xa0;&#xa0;"following" : [2, 3]<br/>}<br/><br/><br/><br/>PUT /users/_doc/2<br/>{<br/>&#xa0;&#xa0;"name": "Elizabeth Ross",<br/>&#xa0;&#xa0;"following" : []<br/>}<br/><br/><br/><br/>PUT /users/_doc/3<br/>{<br/>&#xa0;&#xa0;"name": "Jeremy Brooks",<br/>&#xa0;&#xa0;"following" : [1, 2]<br/>}<br/><br/><br/><br/>PUT /users/_doc/4<br/>{<br/>&#xa0;&#xa0;"name": "Diana Moore",<br/>&#xa0;&#xa0;"following" : [3, 1]<br/>}<br/><br/><br/><br/>PUT /stories/_doc/1<br/>{<br/>&#xa0;&#xa0;"user": 3,<br/>&#xa0;&#xa0;"content": "Wow look, a penguin!"<br/>}<br/><br/><br/><br/>PUT /stories/_doc/2<br/>{<br/>&#xa0;&#xa0;"user": 1,<br/>&#xa0;&#xa0;"content": "Just another day at the office... #coffee"<br/>}<br/><br/><br/><br/>PUT /stories/_doc/3<br/>{<br/>&#xa0;&#xa0;"user": 1,<br/>&#xa0;&#xa0;"content": "Making search great again! #elasticsearch #elk"<br/>}<br/><br/><br/><br/>PUT /stories/_doc/4<br/>{<br/>&#xa0;&#xa0;"user": 4,<br/>&#xa0;&#xa0;"content": "Had a blast today! #rollercoaster #amusementpark"<br/>}<br/><br/><br/><br/>PUT /stories/_doc/5<br/>{<br/>&#xa0;&#xa0;"user": 4,<br/>&#xa0;&#xa0;"content": "Yay, I just got hired as an Elasticsearch consultant - so excited!"<br/>}<br/><br/><br/><br/>PUT /stories/_doc/6<br/>{<br/>&#xa0;&#xa0;"user": 2,<br/>&#xa0;&#xa0;"content": "Chilling at the beach @ Greece #vacation #goodtimes"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="49jb56su46andctqn20uh24t22" MODIFIED="1590991555833" TEXT="Querying stories from a user&apos;s followers">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /stories/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"user": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"index": "users",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"id": 1,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"path": "following"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="1rki8trs3dfmdbkn68ol49ahj2" MODIFIED="1590991555833" POSITION="left" TEXT="11_Controlling Query Results">
<node CREATED="1590991555833" ID="2gctpb58pnret5od9mq0lvse58" MODIFIED="1590991555833" TEXT="filters">
<node CREATED="1590991555833" ID="3snit6e8nijqvc08edbk7l8tlp" MODIFIED="1590991555833" TEXT="Adding a `filter` clause to the `bool` query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"preparation_time_minutes": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lte": 15<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0naec5ip0bv5bgrc4mhn54ikrr" MODIFIED="1590991555833" TEXT="sorting by multi value fields">
<node CREATED="1590991555833" ID="6c1iugifbs903o3iaiqusqqe1b" MODIFIED="1590991555833" TEXT=" Sorting by the average rating (descending)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": "ratings",<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"sort": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ratings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"order": "desc",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"mode": "avg"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;]<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="7gg50agfc3pe5krf75kf256n8h" MODIFIED="1590991555833" TEXT="sorting results">
<node CREATED="1590991555833" ID="3hm2rrk94mr9b0rgj7n5svenla" MODIFIED="1590991555833" TEXT="Sorting by ascending order (implicitly)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"sort": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;"preparation_time_minutes"<br/>&#xa0;&#xa0;]<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1k1ab1c5692828dveobla4ieli" MODIFIED="1590991555833" TEXT="Sorting by descending order">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": "created",<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"sort": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;{ "created": "desc" }<br/>&#xa0;&#xa0;]<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1c4hv6gokesu7vtsf27365njv4" MODIFIED="1590991555833" TEXT="Sorting by multiple fields">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": [ "preparation_time_minutes", "created" ],<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_all": {}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"sort": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;{ "preparation_time_minutes": "asc" },<br/>&#xa0;&#xa0;&#xa0;&#xa0;{ "created": "desc" }<br/>&#xa0;&#xa0;]<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0b4escmomdp8eqg1jhl2h9brpg" MODIFIED="1590991555833" TEXT="source filtering">
<node CREATED="1590991555833" ID="0sm896e6pcv43o2v6sr6bsgfkr" MODIFIED="1590991555833" TEXT="Excluding the `_source` field altogether">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0park1hj26bcjlgs3u868i597n" MODIFIED="1590991555833" TEXT="Only returning the `created` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": "created",<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3g1fs8p79sgnmooljucrp1hej8" MODIFIED="1590991555833" TEXT="Only returning an object&apos;s key">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": "ingredients.name",<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="65rc9en94tgj4qi8cnmv1hjgc9" MODIFIED="1590991555833" TEXT="Returning all of an object&apos;s keys">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": "ingredients.*",<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3v8bslitqldrms7mc2va6ie2bf" MODIFIED="1590991555833" TEXT="Returning the `ingredients` object with all keys, __and__ the `servings` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": [ "ingredients.*", "servings" ],<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="33sbt8a0qqo34br10k5padcli8" MODIFIED="1590991555833" TEXT="Including all of the `ingredients` object&apos;s keys, except the `name` key">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"includes": "ingredients.*",<br/>&#xa0;&#xa0;&#xa0;&#xa0;"excludes": "ingredients.name"<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="2rqvgs1sl6he57d94r78ck6pkv" MODIFIED="1590991555833" TEXT="specifying an offset">
<node CREATED="1590991555833" ID="3ve4kkl6vj5o0shjmhmb1q6pk9" MODIFIED="1590991555833" TEXT="Specifying an offset with the `from` parameter">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"size": 2,<br/>&#xa0;&#xa0;"from": 2,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="61buc3ghepculqdq5451vfioc9" MODIFIED="1590991555833" TEXT="specifying the result format">
<node CREATED="1590991555833" ID="28vtplikvienaikdr0amk1skdd" MODIFIED="1590991555833" TEXT="Returning results as YAML">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search?format=yaml<br/>{<br/>&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="06v6mm53r4eu341h8ha6gp3h8e" MODIFIED="1590991555833" TEXT="Returning pretty JSON">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search?pretty<br/>{<br/>&#xa0;&#xa0;&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": { "title": "pasta" }<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="38h45gn25ok3qrog41atsn4nq8" MODIFIED="1590991555833" TEXT="specifying the result size">
<node CREATED="1590991555833" ID="3gi3bkpll2erisb28plcbiae0c" MODIFIED="1590991555833" TEXT="Using a query parameter">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search?size=2<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4id0pvdqu4qt1l8s5gi1maouuf" MODIFIED="1590991555833" TEXT="Using a parameter within the request body">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"size": 2,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="2btv7q5q1dql0mjel9bk7ngvik" MODIFIED="1590991555833" POSITION="left" TEXT="12_Aggregations">
<node CREATED="1590991555833" ID="3ivja7j33n2831onnlfbsiq2pg" MODIFIED="1590991555833" TEXT="aggregating nested objects">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"employees": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"nested": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"path": "employees"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/><br/>GET /department/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"employees": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"nested": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"path": "employees"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"minimum_age": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "employees.age"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6jq0s0pmj4l1k8gbr42tjkfkeu" MODIFIED="1590991555833" TEXT="defining bucket rules with filters">
<node CREATED="1590991555833" ID="614jnjqde9kok4qpj3iu5nemn7" MODIFIED="1590991555833" TEXT="Placing documents into buckets based on criteria">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"my_filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filters": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filters": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"pasta": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"spaghetti": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "spaghetti"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2ticqun0ns1cg4c40konkucc74" MODIFIED="1590991555833" TEXT="Calculate average ratings for buckets">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /recipe/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"my_filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filters": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filters": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"pasta": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "pasta"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"spaghetti": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": "spaghetti"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"avg_rating": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"avg": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "ratings"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3t1ngbi2j55v2ucrm49oeuku68" MODIFIED="1590991555833" TEXT="filtering out documents">
<node CREATED="1590991555833" ID="1imudv84s68ps8d53fn15tb36d" MODIFIED="1590991555833" TEXT="Filtering out documents with low `total_amount`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"low_value": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"total_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lt": 50<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1t5t6ifok25t31h8cdq6imp30c" MODIFIED="1590991555833" TEXT="Aggregating on the bucket of remaining documents">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"low_value": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"total_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lt": 50<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"avg_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"avg": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="5temcool1u4k3kdhpq2ochj7ga" MODIFIED="1590991555833" TEXT="global aggregation">
<node CREATED="1590991555833" ID="6dd334pepk0npa940hf0v1rch1" MODIFIED="1590991555833" TEXT="Break out of the aggregation context">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"total_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 100<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"all_orders": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"global": { },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="11hqho23nm3l7qncusj2jeek6q" MODIFIED="1590991555833" TEXT="Adding aggregation without global context">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"total_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 100<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"all_orders": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"global": { },<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;"stats_expensive": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="74927r6ps9v2s29lp1brmrrkto" MODIFIED="1590991555833" TEXT="histograms">
<node CREATED="1590991555833" ID="2e7ceg81gnmo5h0qm5bfjt27he" MODIFIED="1590991555833" TEXT="Distribution of `total_amount` with interval `25`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"amount_distribution": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"histogram": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"interval": 25<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="363mgk9mfn2n7djk77sntfmn50" MODIFIED="1590991555833" TEXT="Requiring minimum 1 document per bucket">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"amount_distribution": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"histogram": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"interval": 25,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min_doc_count": 1<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6mrspbiofk9rd3c21d5du0e203" MODIFIED="1590991555833" TEXT="Specifying fixed bucket boundaries">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"total_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 100<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"amount_distribution": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"histogram": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"interval": 25,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min_doc_count": 0,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"extended_bounds": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min": 0,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"max": 500<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="39ntrocjtoieggl9s9d9k6c648" MODIFIED="1590991555833" TEXT="Aggregating by month with the `date_histogram` aggregation">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"orders_over_time": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"date_histogram": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "purchased_at",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"interval": "month"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="19r0jeguar2qvej4gpmft34osc" MODIFIED="1590991555833" TEXT="introduction to aggregations">
<node CREATED="1590991555833" ID="23bcovog9bqgf4me71es88gclq" MODIFIED="1590991555833" TEXT="Adding `order` index and mappings">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /order<br/>{<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"purchased_at": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "date"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lines": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "nested",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"product_id": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "integer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "double"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"quantity": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "short"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"total_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "double"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"status": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"sales_channel": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"salesman": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "object",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"id": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "integer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="3eicdm7pb04tcnsopo2v5frch9" MODIFIED="1590991555833" TEXT="Populating the `order` index with test data">
<richcontent TYPE="NOTE"><html><head/><body><p>curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/order/_doc/_bulk?pretty' --data-binary "@orders-bulk.json"</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="6e2qkth7vtbt3rfiqbu3erofch" MODIFIED="1590991555833" TEXT="introduction to bucket aggregations">
<node CREATED="1590991555833" ID="6bfq3oba00rp3phmt35anhsm6i" MODIFIED="1590991555833" TEXT="Creating a bucket for each `status` value">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"status_terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status.keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1ihpckgj9tbh80rm433nqebjcr" MODIFIED="1590991555833" TEXT="Including `20` terms instead of the default `10`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"status_terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status.keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"size": 20<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4lhmqb0hd93uc9dt1ikddl3nf7" MODIFIED="1590991555833" TEXT="Aggregating documents with missing field (or `NULL`)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"status_terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status.keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"size": 20,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"missing": "N/A"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="352foqegrsbklj9iasqvmb53lv" MODIFIED="1590991555833" TEXT="Changing the minimum document count for a bucket to be created">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"status_terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status.keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"size": 20,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"missing": "N/A",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min_doc_count": 0<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1k0a97440uos576vmngbiujci5" MODIFIED="1590991555833" TEXT="Ordering the buckets">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"status_terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status.keyword",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"size": 20,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"missing": "N/A",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min_doc_count": 0,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"order": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"_key": "asc"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="40h0gkqni5eh66dnlbp4kae1oa" MODIFIED="1590991555833" TEXT="metric aggregations">
<node CREATED="1590991555833" ID="4r036td6oahhmv7oebgfnbc4jk" MODIFIED="1590991555833" TEXT="Calculating statistics with `sum`, `avg`, `min`, and `max` aggregations">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"total_sales": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"sum": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;"avg_sale": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"avg": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;"min_sale": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"min": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;"max_sale": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"max": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2t1d4eekr3hlb27ftbfa89vgn0" MODIFIED="1590991555833" TEXT="Retrieving the number of distinct values">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"total_salesmen": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"cardinality": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "salesman.id"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6cgkdqree152j5101e1vk183fu" MODIFIED="1590991555833" TEXT="Retrieving the number of values">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"values_count": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"value_count": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6khlcc65v6kket94cgmjua495t" MODIFIED="1590991555833" TEXT="Using `stats` aggregation for common statistics">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"amount_stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="036b9sj0b2rnbchjmjhhafgqqf" MODIFIED="1590991555833" TEXT="missing field values">
<node CREATED="1590991555833" ID="6rtm0766c06k5pqvefomih2bau" MODIFIED="1590991555833" TEXT="Adding test documents">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /order/_doc/1001<br/>{<br/>&#xa0;&#xa0;"total_amount": 100<br/>}<br/><br/><br/><br/>POST /order/_doc/1002<br/>{<br/>&#xa0;&#xa0;"total_amount": 200,<br/>&#xa0;&#xa0;"status": null<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6hbn6pqljjfeia01e8qpdntp0h" MODIFIED="1590991555833" TEXT="Aggregating documents with missing field value">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_doc/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"orders_without_status": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"missing": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status.keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="2frd171nm6hkpgibd27s1ie2vd" MODIFIED="1590991555833" TEXT="Combining `missing` aggregation with other aggregations">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_doc/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"orders_without_status": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"missing": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status.keyword"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"missing_sum": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"sum": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4i43ggj0hbtd1ulkbqkn6uqk78" MODIFIED="1590991555833" TEXT="Deleting test documents">
<richcontent TYPE="NOTE"><html><head/><body><p>DELETE /order/_doc/1001<br/><br/><br/><br/>DELETE /order/_doc/1002</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="0ee1slcb1mtnlj8ks193rf0oge" MODIFIED="1590991555833" TEXT="nested aggregations">
<node CREATED="1590991555833" ID="3e57r6k7nmjtpe1vtpomvpvf1m" MODIFIED="1590991555833" TEXT="Retrieving statistics for each status">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"status_terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"status_stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="08a7qe03nn5dbc64a4042ugvf1" MODIFIED="1590991555833" TEXT="Narrowing down the aggregation context">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"total_amount": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"gte": 100<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"status_terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"terms": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "status"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"status_stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3jr22b8c473se4556p54osk14t" MODIFIED="1590991555833" TEXT="range aggregations">
<node CREATED="1590991555833" ID="5tpjtbaj556ve2m0e12kkc6qk2" MODIFIED="1590991555833" TEXT="`range` aggregation">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"amount_distribution": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ranges": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": 50<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": 50,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": 100<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": 100<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="21e6o9jfb611ojbakat1vn211d" MODIFIED="1590991555833" TEXT="`date_range` aggregation">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"purchased_ranges": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"date_range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "purchased_at",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ranges": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+6M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01||+6M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+1y"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0b4ohmbhs9g0voe1ql5nippd2l" MODIFIED="1590991555833" TEXT="Specifying the date format">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"purchased_ranges": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"date_range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "purchased_at",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"format": "yyyy-MM-dd",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"keyed": true,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ranges": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+6M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01||+6M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+1y"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7glag5i9m45gg91aif2alqbig4" MODIFIED="1590991555833" TEXT="Enabling keys for the buckets">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"purchased_ranges": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"date_range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "purchased_at",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"format": "yyyy-MM-dd",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"keyed": true,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ranges": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+6M"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01||+6M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+1y"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0eiihv402blb9h9t5fc784lj6u" MODIFIED="1590991555833" TEXT="Defining the bucket keys">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"purchased_ranges": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"date_range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "purchased_at",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"format": "yyyy-MM-dd",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"keyed": true,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ranges": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+6M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"key": "first_half"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01||+6M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+1y",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"key": "second_half"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7bjssgudmopkqufk4735ni2b5l" MODIFIED="1590991555833" TEXT="Adding a sub-aggregation">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /order/_search<br/>{<br/>&#xa0;&#xa0;"size": 0,<br/>&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"purchased_ranges": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"date_range": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "purchased_at",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"format": "yyyy-MM-dd",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"keyed": true,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"ranges": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+6M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"key": "first_half"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"from": "2016-01-01||+6M",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"to": "2016-01-01||+1y",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"key": "second_half"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"aggs": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"bucket_stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stats": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"field": "total_amount"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
<node CREATED="1590991555833" ID="6pgv8ltu7rfhsbuk3atb3gif6h" MODIFIED="1590991555833" POSITION="left" TEXT="13_Improving Search Results">
<node CREATED="1590991555833" ID="43h7hft8d7fa2d5962sdlme9bp" MODIFIED="1590991555833" TEXT="adding synonyms from file">
<node CREATED="1590991555833" ID="5lophc54bb3mfuqqajd2o2bk9a" MODIFIED="1590991555833" TEXT="Adding index with custom analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /synonyms<br/>{<br/>&#xa0;&#xa0;"settings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"analysis": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonym_test": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "synonym",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonyms_path": "analysis/synonyms.txt"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"my_analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonym_test"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": "my_analyzer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0slcl5ns0afii9n9den6dvojev" MODIFIED="1590991555833" TEXT="Synonyms file (`config/analysis/synonyms.txt`)">
<richcontent TYPE="NOTE"><html><head/><body><p># This is a comment<br/><br/>awful =&gt; terrible<br/>awesome =&gt; great, super<br/>elasticsearch, logstash, kibana =&gt; elk<br/>weird, strange</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0jl9akeohslt276nqtg198tgoa" MODIFIED="1590991555833" TEXT="Testing the analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /synonyms/_analyze<br/>{<br/>&#xa0;&#xa0;"analyzer": "my_analyzer",<br/>&#xa0;&#xa0;"text": "Elasticsearch"<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="5fhff5r9ivrg257tgd7h1uv35e" MODIFIED="1590991555833" TEXT="adding synonyms">
<node CREATED="1590991555833" ID="2h2ercajscndlpem0eqg36frar" MODIFIED="1590991555833" TEXT="Creating index with custom analyzer">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /synonyms<br/>{<br/>&#xa0;&#xa0;"settings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"analysis": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonym_test": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "synonym", <br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonyms": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"awful =&gt; terrible",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"awesome =&gt; great, super",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"elasticsearch, logstash, kibana =&gt; elk",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"weird, strange"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"my_analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonym_test"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": "my_analyzer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1l0i3bskkji4pjrggict7r5lvq" MODIFIED="1590991555833" TEXT="Testing the analyzer (with synonyms)">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /synonyms/_analyze<br/>{<br/>&#xa0;&#xa0;"analyzer": "my_analyzer",<br/>&#xa0;&#xa0;"text": "awesome"<br/>}<br/><br/><br/><br/>POST /synonyms/_analyze<br/>{<br/>&#xa0;&#xa0;"analyzer": "my_analyzer",<br/>&#xa0;&#xa0;"text": "Elasticsearch"<br/>}<br/><br/><br/><br/>POST /synonyms/_analyze<br/>{<br/>&#xa0;&#xa0;"analyzer": "my_analyzer",<br/>&#xa0;&#xa0;"text": "weird"<br/>}<br/><br/><br/><br/>POST /synonyms/_analyze<br/>{<br/>&#xa0;&#xa0;"analyzer": "my_analyzer",<br/>&#xa0;&#xa0;"text": "Elasticsearch is awesome, but can also seem weird sometimes."<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0e90871bcvao37h71mds5p2faj" MODIFIED="1590991555833" TEXT="Adding a test document">
<richcontent TYPE="NOTE"><html><head/><body><p>POST /synonyms/_doc<br/>{<br/>&#xa0;&#xa0;"description": "Elasticsearch is awesome, but can also seem weird sometimes."<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1hsefqgnupnse9iegbisrpbp61" MODIFIED="1590991555833" TEXT="Searching the index for synonyms">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /synonyms/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": "great"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/><br/>GET /synonyms/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": "awesome"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3i56cfv3phl9742j8voj17ur2n" MODIFIED="1590991555833" TEXT="affecting relevance scoring with proximity">
<node CREATED="1590991555833" ID="0p3au2mpgb3u5tbpvcafe8a80u" MODIFIED="1590991555833" TEXT="A simple `match` query within a `bool` query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /proximity/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "spicy sauce"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1ra0l7f338abo9go040455ev4h" MODIFIED="1590991555833" TEXT="Boosting relevance based on proximity">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /proximity/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "spicy sauce"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "spicy sauce"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="7vt3rpku74tlsg1rsmr07fvond" MODIFIED="1590991555833" TEXT="Adding the `slop` parameter">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /proximity/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"bool": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"must": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "spicy sauce"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;],<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"should": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;{<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "spicy sauce",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"slop": 5<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="3ec64tmb2b753uvubfef873rcn" MODIFIED="1590991555833" TEXT="fuzzy match query">
<node CREATED="1590991555833" ID="6kribdbc0t6futkp6l49s2q7po" MODIFIED="1590991555833" TEXT="Searching with `fuzziness` set to `auto`">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "l0bster",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzziness": "auto"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/><br/>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "lobster",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzziness": "auto"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="4rqvses9p63fdr0ulbb34led6p" MODIFIED="1590991555833" TEXT="Fuzziness is per term (and specifying an integer)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "l0bster love",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"operator": "and",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzziness": 1<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="25b79gk6e1rc5gd6rnj1l5rrub" MODIFIED="1590991555833" TEXT="Switching letters around with transpositions">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "lvie",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzziness": 1<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5qnhpbu6pa4a0tv7at4rgfci7a" MODIFIED="1590991555833" TEXT="Disabling transpositions">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "lvie",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzziness": 1,<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzzy_transpositions": false<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/></p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="6lqo84on5omekocm86fbkdvb00" MODIFIED="1590991555833" TEXT="fuzzy query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"fuzzy": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"value": "LOBSTER",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzziness": "auto"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/>GET /product/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"fuzzy": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"value": "lobster",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"fuzziness": "auto"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0asjvjrp5agl94rovljc7m9n62" MODIFIED="1590991555833" TEXT="highlighting matches in fields">
<node CREATED="1590991555833" ID="7s91u18rdp9bvoce0b7gv688v1" MODIFIED="1590991555833" TEXT="Adding a test document">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /highlighting/_doc/1<br/>{<br/>&#xa0;&#xa0;"description": "Let me tell you a story about Elasticsearch. It's a full-text search engine that is built on Apache Lucene. It's really easy to use, but also packs lots of advanced features that you can use to tweak its searching capabilities. Lots of well-known and established companies use Elasticsearch, and so should you!"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0ckcl3s8g22690iia0dp1h4o8g" MODIFIED="1590991555833" TEXT="Highlighting matches within the `description` field">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /highlighting/_search<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "description": "Elasticsearch story" }<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"highlight": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"fields": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description" : {}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="15am7htnhb22m32laqidpe15fg" MODIFIED="1590991555833" TEXT="Specifying a custom tag">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /highlighting/_search<br/>{<br/>&#xa0;&#xa0;"_source": false,<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": { "description": "Elasticsearch story" }<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"highlight": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"pre_tags": [ "&lt;strong&gt;" ],<br/>&#xa0;&#xa0;&#xa0;&#xa0;"post_tags": [ "&lt;/strong&gt;" ],<br/>&#xa0;&#xa0;&#xa0;&#xa0;"fields": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description" : {}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="47mci850fbmqpikhjslk0k3n2u" MODIFIED="1590991555833" TEXT="proximity searches">
<node CREATED="1590991555833" ID="5a4a4ju1bin20g9cppe8v7as9i" MODIFIED="1590991555833" TEXT="Adding test documents">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /proximity/_doc/1<br/>{<br/>&#xa0;&#xa0;"title": "Spicy Sauce"<br/>}<br/><br/><br/><br/>PUT /proximity/_doc/2<br/>{<br/>&#xa0;&#xa0;"title": "Spicy Tomato Sauce"<br/>}<br/><br/><br/><br/>PUT /proximity/_doc/3<br/>{<br/>&#xa0;&#xa0;"title": "Spicy Tomato and Garlic Sauce"<br/>}<br/><br/><br/><br/>PUT /proximity/_doc/4<br/>{<br/>&#xa0;&#xa0;"title": "Tomato Sauce (spicy)"<br/>}<br/><br/><br/><br/>PUT /proximity/_doc/5<br/>{<br/>&#xa0;&#xa0;"title": "Spicy and very delicious Tomato Sauce"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="5h4u9npd2h7heioj0sdjkp55pl" MODIFIED="1590991555833" TEXT="Adding the `slop` parameter to a `match_phrase` query">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /proximity/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "spicy sauce",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"slop": 1<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}<br/><br/><br/><br/>GET /proximity/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match_phrase": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"title": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"query": "spicy sauce",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"slop": 2<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
<node CREATED="1590991555833" ID="00gfhbifu885tmgmkk1mn6lcli" MODIFIED="1590991555833" TEXT="stemming">
<node CREATED="1590991555833" ID="3ghlfej823vu90vpj6hpjjis2m" MODIFIED="1590991555833" TEXT="Creating a test index">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /stemming_test<br/>{<br/>&#xa0;&#xa0;"settings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"analysis": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonym_test": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "synonym",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonyms": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"firm =&gt; company",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"love, enjoy"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stemmer_test" : {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type" : "stemmer",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"name" : "english"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;},<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"my_analyzer": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"tokenizer": "standard",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"filter": [<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"lowercase",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"synonym_test",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"stemmer_test"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;]<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"mappings": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"properties": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"type": "text",<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"analyzer": "my_analyzer"<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="1vgd97172gqhm5n7v1eqv3vk09" MODIFIED="1590991555833" TEXT="Adding a test document">
<richcontent TYPE="NOTE"><html><head/><body><p>PUT /stemming_test/_doc/1<br/>{<br/>&#xa0;&#xa0;"description": "I love working for my firm!"<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="0eds96iv7ssg3d16e71uij5nfm" MODIFIED="1590991555833" TEXT="Matching the document with the base word (`work`)">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /stemming_test/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": "enjoy work"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="6ssnut5dh9mqr5nvsu8g11jp3c" MODIFIED="1590991555833" TEXT="The query is stemmed, so the document still matches">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /stemming_test/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": "love working"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
<node CREATED="1590991555833" ID="74ifm8ctcuva0099asphduubrd" MODIFIED="1590991555833" TEXT="Synonyms and stemmed words are still highlighted">
<richcontent TYPE="NOTE"><html><head/><body><p>GET /stemming_test/_search<br/>{<br/>&#xa0;&#xa0;"query": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"match": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": "enjoy work"<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;},<br/>&#xa0;&#xa0;"highlight": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;"fields": {<br/>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;"description": {}<br/>&#xa0;&#xa0;&#xa0;&#xa0;}<br/>&#xa0;&#xa0;}<br/>}</p></body></html></richcontent>
</node>
</node>
</node>
</node>
</map>
