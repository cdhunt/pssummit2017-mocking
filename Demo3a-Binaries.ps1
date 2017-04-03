Describe 'Binaries' {
    Context 'LocalHost' {

        function ping { return @'
Pinging LOCALHOST [::1] with 32 bytes of data:
Reply from ::1: time<1ms
Reply from ::1: time<1ms
Ping statistics for ::1:
    Packets: Sent = 2, Received = 2, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum = 0ms, Average = 0ms
'@
        }

        $results = ping localhost
        $results | Should Match '0% loss'
    }
}


Describe 'Binaries Again' {
    Context 'Psudo-Behavior Verificaiton' {

        function ping { return $args[0] }

        $results = ping remotehost
        $results | Should Be 'remotehost'

    }
}

