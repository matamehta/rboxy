{tag: 'body', has: [
    {has: [
    	{tag: 'table' , has: [
    	    {tag: 'tr', has: [
                {tag: 'th', has: ['First Name']},
                {tag: 'th', has: ['Last Name']} 
            ]},
    	    {tag: 'tr', bind: 'foreach: user', has: [
    	        {tag: 'td', bind: 'text: first_name'},
    	        {tag: 'td', bind: 'text: last_name'}	
    	    ]}
    	]}
    ]}
]} 