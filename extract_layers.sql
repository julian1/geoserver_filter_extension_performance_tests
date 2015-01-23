
-- sudo -u postgres psql -d geonetwork   -f query.sql

select 
        unnest( xpath( '//gmd:URL[text()="http://geoserver-123.aodn.org.au/geoserver/wms"]/../../gmd:name/gmx:MimeFileType/text()|//gmd:URL[text()="http://geoserver-123.aodn.org.au/geoserver/wms"]/../../gmd:name/gco:CharacterString/text()', 

        data::xml, '{ { mcp, http://schemas.aodn.org.au/mcp-2.0 }, { gmd, http://www.isotc211.org/2005/gmd },  { gco, "http://www.isotc211.org/2005/gco"  }, { gmx, "http://www.isotc211.org/2005/gmx" }  }  ' )     ) as wms_link 
        from metadata where source = '5c6d6b45-1659-435c-91a7-4147caeed8a4' 
        order by uuid
;


