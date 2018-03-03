/*
    Add sample data
*/
-- Add edge labels
insert
  into ref_edge_label(edge_label, reverse_edge_label)
 values ('secretely owns', 'secretely owned by'), ('partnership', 'partnership'), ('sues', 'sued by');


-- Add fiction companies to vertices
insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "ACME Corporation",
       "established": "1980-05-12",
       "motto": "We will rock you!",
       "CEO": "John McLein",
       "About": "The Acme Corporation is a fictional corporation that features prominently in Warner Bros. animated shorts, more specifically, the Road Runner/Wile E. Coyote cartoons as a running gag featuring outlandish products that fail or backfire catastrophically at the worst possible times. The name is also used as a generic title in many cartoons, films, TV series, commercials and comic strips."
    }
    $data$
 as jsonb));
 
insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Prestige Worldwide",
       "established": "2008-01-12",
       "motto": "We will prestige you!",
       "CEO": "Dumb Rodgers",
       "About": "In the 2008 film Step Brothers, Will Ferrell and John C. Reilly debut Prestige Worldwide, their faux-conglomerate that's \"the first word in entertainment, management, financial portfolios... black leather gloves\" and some other stuff. Their PowerPoint presentation may have been laughably inept, but their NSFW \"Boats and Hoes\" rap video won them legions of fans and investors -- possibly you!"
    }
    $data$
 as jsonb));

insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Dunder Mifflin",
       "established": "2010-02-12",
       "motto": "Mifflin the truth!",
       "CEO": "Dunder Mifflin",
       "About": "On the surface, working at Dunder Mifflin sounds about as exciting as changing a toner cartridge: The company manufactures and distributes office products -- and much of what we see on the show takes place in the sleepy burg of Scranton, PA. Still, who among us hasn't wished that we worked in NBC's The Office, where they celebrate holidays like Diwali, and there's always some candy at the reception desk?"
    }
    $data$
 as jsonb));

insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Bluth Company",
       "established": "2009-02-12",
       "motto": "We will rock you!",
       "CEO": "Michael Bluth",
       "About": "C'mon, is a comedy really a comedy unless the Securities and Exchange Commission is written into the script? Arrested Development's plot is built upon the Bluth family business's demise (in this housing market, who needs minimansions?) and subsequent scandal. When his CEO father goes to jail, Michael Bluth (Jason Bateman) is in, and out, and in again as boss man"
    }
    $data$
 as jsonb));


insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Initech",
       "established": "1999-03-12",
       "motto": "Let office rock!",
       "CEO": "Mike Judge",
       "About": "If fed-up JetBlue flight attendant Steven Slater -- who grabbed a beer before exiting the plane via the emergency chute after an altercation with a passenger -- had worked in an office before taking to the skies, we like to think it would have been at this one. Initech, the IT company in Mike Judge's 1999 cult comedy Office Space, feels depressingly familiar, especially in today's job market: It's all about downsizing, TPS report cover sheets, and memos about memos."
    }
    $data$
 as jsonb));

insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Sterling Cooper Draper Pryce",
       "established": "1960-04-22",
       "motto": "Let 60th bee with you!",
       "CEO": "Don Draper",
       "About": "A day in the life at Mad Men's Madison Avenue advertising agency doesn't just offer a glimpse of Don Draper's deft handling of both clients and women. SCDP is also a place that allows 21st-century television viewers to better understand 1960s mores like sexism and racism outside the lens of political correctness."
    }
    $data$
 as jsonb));

insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Gekko & Co.",
       "established": "1971-05-09",
       "motto": "Gekko will help you!",
       "CEO": "Gordon Gekko",
       "About": "At Gordon Gekko's Wall Street firm, Blue Horseshoe loves Anacott Steel, insider trading is the norm, and $800,000 is \"a day's pay.\" Michael Douglas's performance as the \"greed is good\" Wall Street villain earned him a Best Actor Oscar in 1988."
    }
    $data$
 as jsonb));

insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Central Perk",
       "established": "1981-06-09",
       "motto": "All for Rachel",
       "CEO": "Gunter Gunter",
       "About": "We'll never know how good the mochas and muffins were at the coffee-bar hangout on Friends, and we don't really care. We just love this place for its seemingly looped but live \"Smelly Cat\" soundtrack."
    }
    $data$
 as jsonb));


insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Stark Industries",
       "established": "2005-07-09",
       "motto": "Stark is a superstar!",
       "CEO": "Anthony Stark",
       "About": "In Marvel's Iron Man films, Robert Downey Jr.'s character, Tony Stark, owns a weapons/defense company whose objectives are drastically reset after Stark is critically wounded. Bottom line: Stark builds glowing arc reactors and Gwyneth Paltrow works there. Maybe you know someone who knows someone who could get you a phone screener?"
    }
    $data$
 as jsonb));

insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Duke & Duke",
       "established": "1983-12-09",
       "motto": "No motto at all",
       "CEO": "Mortimer Duke",
       "About": "Thanks to actions taken by Duke & Duke in the film, Section 746 of the 2010 Dodd-Frank Reform and Consumer Protection Act contains what's informally known as the \"Eddie Murphy Rule.\" The rule bans the use of misappropriated government information in commodities trading."
    }
    $data$
 as jsonb));

insert 
  into vertex(vertex_data)
 values (cast($data$
    {
       "name": "Lanford Lunch Box",
       "established": "1989-11-09",
       "motto": "Best coffee is our passion",
       "CEO": "Roseanne Lanford",
       "About": "With Roseanne and Jackie in the kitchen, the chances of getting a good meal at the coffee shop on Roseanne were about nil. Those of us who didn't know what a loose-meat sandwich was -- yes, middle America, we're out there -- got something of a culinary education from the Lunch Box too. (If you're lacking loose-meat cred: It's basically a broken-up hamburger, with onion, on a bun. Pickles optional. Where we come from, that's called a sloppy joe.)"
    }
    $data$
 as jsonb));

-- Add company relations to edges
insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'secretely owns' as edge_label,
        cast($data$
            {
                "from_vertex_type": "corporation",
                "to_vertex_type": "small business"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'ACME Corporation') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Lanford Lunch Box') vertex_to;

insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'secretely owns' as edge_label,
        cast($data$
            {
                "from_vertex_type": "corporation",
                "to_vertex_type": "middle-size business"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Prestige Worldwide') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Duke & Duke') vertex_to;

insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'secretely owns' as edge_label,
        cast($data$
            {
                "from_vertex_type": "corporation",
                "to_vertex_type": "corporation"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Stark Industries') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Gekko & Co.') vertex_to;


insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'secretely owns' as edge_label,
        cast($data$
            {
                "from_vertex_type": "corporation",
                "to_vertex_type": "corporation"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Gekko & Co.') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Initech') vertex_to;


insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'secretely owns' as edge_label,
        cast($data$
            {
                "from_vertex_type": "corporation",
                "to_vertex_type": "small business"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Initech') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Central Perk') vertex_to;
  

insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'partnership' as edge_label,
        cast($data$
            {
                "from_vertex_type": "supplier",
                "to_vertex_type": "buyer"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Stark Industries') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Initech') vertex_to;
  
insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'partnership' as edge_label,
        cast($data$
            {
                "from_vertex_type": "supplier",
                "to_vertex_type": "buyer"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Initech') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Gekko & Co.') vertex_to;
  
insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'sues' as edge_label,
        cast($data$
            {
                "from_vertex_type": "plaintiff",
                "to_vertex_type": "defendant"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Stark Industries') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Central Perk') vertex_to;


insert
  into edge(vertex_from_id, vertex_to_id, edge_label, edge_data)
  select 
        vertex_from.vertex_id,
        vertex_to.vertex_id,
        'sues' as edge_label,
        cast($data$
            {
                "from_vertex_type": "plaintiff",
                "to_vertex_type": "defendant"
            }
        $data$ as jsonb) as edge_data
    from 
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Central Perk') vertex_from
  cross join
 (select vertex_id
   from vertex 
  where (vertex_data ->> 'name') = 'Stark Industries') vertex_to;
