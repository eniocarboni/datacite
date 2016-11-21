## See bin/lift_embargo
$c->{'notify_embargo_expiry'} = sub {
	my $eprint=shift;
	my $doc=shift;
	my $session=$eprint->repository;
	my $handler = $session->plugin( "Event::DataCiteEvent", datasetid=>'archive' );
	unless($handler) {
		print STDERR "FATAL ERROR: EPrints::Plugin::Event::DataCiteEvent handler not available\n";
		return;
	}
	my $ret=$handler->datacite_doi($eprint);
	my $eprintdoifield = $session->get_conf( "datacitedoi", "eprintdoifield");
	if (! defined $ret || $ret eq EPrints::Const::HTTP_OK) {
		print STDERR "Doi coined for eprint ".$eprint->get_id." [".$eprint->get_value($eprintdoifield)."]\n";
	}
	else {
		print STDERR "Error $ret while trying to coin doi for eprint ".$eprint->get_id."\n";
	}
	return;
};
