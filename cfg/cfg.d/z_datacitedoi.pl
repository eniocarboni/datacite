#Enable the plugin
$c->{plugins}{"Export::DataCiteXML"}{params}{disable} = 0;
$c->{plugins}{"Event::DataCiteEvent"}{params}{disable} = 0;

#which field do use for the doi
$c->{datacitedoi}{eprintdoifield} = "doi";

#set these (you will get the from data site)
# doi = {prefix}/{repoid}/{eprintid}
$c->{datacitedoi}{repoid} = $c->{"host"};

#  **************************************
#  ******  test enviroement  ***********
#  **************************************
#When should you register/update doi info.
# set archive=>1 to enable events job
$c->{datacitedoi}{eprintstatus} = {inbox=>0,buffer=>0,archive=>0,deletion=>0};
$c->{datacitedoi}{prefix} = "10.5072";
#$c->{datacitedoi}{apiurl} = "https://test.datacite.org/mds/";
$c->{datacitedoi}{apiurl} = "https://mds.test.datacite.org/";
$c->{datacitedoi}{user} = "USER";
$c->{datacitedoi}{pass} = "PASS";

#  **************************************
#  ******  prod enviroenment  ***********
#  **************************************
#When should you register/update doi info.
#$c->{datacitedoi}{eprintstatus} = {inbox=>0,buffer=>0,archive=>1,deletion=>0};
#$c->{datacitedoi}{prefix} = "10.5072";
#$c->{datacitedoi}{apiurl} = "https://mds.datacite.org/doi";
#$c->{datacitedoi}{user} = "USER_PROD";
#$c->{datacitedoi}{pass} = "PASS_PROD";

# datacite requires a Publisher 
# The name of the entity that holds, archives, publishes, 
# prints, distributes, releases, issues, or produces the 
# resource. This property will be used to formulate the 
# citation, so consider the prominence of the role.
# eg World Data Center for Climate (WDCC); 	
$c->{datacitedoi}{publisher} = "*** Publisher required ***";

# need to map eprint type (article, dataset etc) to ResourceType
# Controled list http://schema.datacite.org/meta/kernel-2.2/doc/DataCite-MetadataKernel_v2.2.pdf
# where v is the ResourceType and a is the resourceTypeGeneral
$c->{datacitedoi}{typemap}{article} = {v=>'Article',a=>'Text'};
$c->{datacitedoi}{typemap}{book_section} = {v=>'BookSection',a=>'Text'};
$c->{datacitedoi}{typemap}{monograph} = {v=>'Monograph',a=>'Text'};
$c->{datacitedoi}{typemap}{thesis} = {v=>'Thesis',a=>'Text'};
$c->{datacitedoi}{typemap}{book} = {v=>'Book',a=>'Text'};
$c->{datacitedoi}{typemap}{patent} = {v=>'Patent',a=>'Text'};
$c->{datacitedoi}{typemap}{artefact} = {v=>'Artefact',a=>'PhysicalObject'};
$c->{datacitedoi}{typemap}{performance} = {v=>'Performance',a=>'Event'};
$c->{datacitedoi}{typemap}{composition} = {v=>'Composition',a=>'Sound'};
$c->{datacitedoi}{typemap}{image} = {v=>'Image',a=>'Image'};
$c->{datacitedoi}{typemap}{experiment} = {v=>'Experiment',a=>'Text'};
$c->{datacitedoi}{typemap}{teaching_resource} = {v=>'TeachingResourse',a=>'InteractiveResource'};
$c->{datacitedoi}{typemap}{other} = {v=>'Misc',a=>'Collection'};
$c->{datacitedoi}{typemap}{dataset} = {v=>'Dataset',a=>'Dataset'};
$c->{datacitedoi}{typemap}{audio} = {v=>'Audio',a=>'Sound'};
$c->{datacitedoi}{typemap}{video} = {v=>'Video',a=>'Film'};
