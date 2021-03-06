package TPF::SoC::Types;

use MooseX::Types -declare => ['RFC2822Date', 'Student', 'Report'];

use MooseX::Types::Moose 'Str';
use MooseX::Types::DateTime 'DateTime';
use DateTime::Format::Mail;

subtype RFC2822Date, as DateTime;

coerce RFC2822Date, from Str, via {
    DateTime::Format::Mail->parse_datetime($_);
};

class_type Student, { class => 'TPF::SoC::Student' };
class_type Report, { class => 'TPF::SoC::Report' };

1;
