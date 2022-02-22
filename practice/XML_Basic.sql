
-- PostgreSQL XML Functions


--XML 


--1 xmlcomment() function

select xmlcomment('this is a text'); 

-- 2 xmlconcat() function

select xmlconcat('<books/>', '<book>w3resource tutorials</book>');


SELECT xmlconcat('<?xml version="1.1"?><books/>', 
			'<?xml version="1.1" standalone="no"?><book/>');

--xmlelement() function
--
--This function generates an XML element 
--with the given name, attributes, and content.		
		
SELECT xmlelement(name books);
		
		
		
SELECT xmlelement(name books, xmlattributes('title' as w3resource));
		
SELECT xmlelement(name calendar, xmlattributes(current_date as date), 'current', ' date');
		
		
SELECT xmlelement(name newelement, xmlattributes('xyz' as bar),
xmlelement(name abc),
xmlcomment('test'),
xmlelement(name xyz));
		
SELECT xmlforest('book' AS newelement, 123 AS number);
		
		

select current_schemas(true); 

select user ;

select version() ;
















		
		
		
		