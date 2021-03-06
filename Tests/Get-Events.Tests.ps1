﻿Describe 'Get-Events - Basic Test' {
    $Date = (Get-Date).AddDays(-60)
    $Date1 = Get-Date

    $Events = Get-Events -Machine $Env:COMPUTERNAME -DateFrom $Date -DateTo $Date1 -ID 5617 -LogName 'Application' -Verbose

    It 'Should have GatheredLogName, GatheredFrom fields properly filled in' {
        $Events[0].GatheredFrom | Should -Be $Env:COMPUTERNAME
        $Events[0].GatheredLogName | Should -Be 'Application'
    }
    It 'Should have more then 1 event' {
        $Events.Count | Should -BeGreaterOrEqual 1
    }
    It 'Should return an Array' {
        $Events -is [Array] | Should -Be $true
    }
    It 'Should return proper Level' {
        $Events[0].LevelDisplayName | Should -Be 'Information'
    }
    It 'Should return proper LogName' {
        $Events[0].LogName | Should -Be 'Application'
    }
    It 'Should return proper ID (EventID)' {
        $Events[0].ID | Should -Be 5617
    }
}
Describe 'Get-Events - MaxEvents Test' {
    $Date = (Get-Date).AddDays(-60)
    $Date1 = Get-Date

    $Events = Get-Events -Machine $Env:COMPUTERNAME -DateFrom $Date -DateTo $Date1 -ID 5617 -LogName 'Application' -MaxEvents 1 -Verbose

    It 'Should have GatheredLogName, GatheredFrom fields properly filled in' {
        $Events[0].GatheredFrom | Should -Be $Env:COMPUTERNAME
        $Events[0].GatheredLogName | Should -Be 'Application'
    }
    It 'Should have exactly 1 event' {
        $Events.Count | Should -BeExactly 1
    }
    It 'Should return an Array' {
        $Events -is [Array] | Should -Be $true
    }
    It 'Should return proper Level' {
        $Events[0].LevelDisplayName | Should -Be 'Information'
    }
    It 'Should return proper LogName' {
        $Events[0].LogName | Should -Be 'Application'
    }
    It 'Should return proper ID (EventID)' {
        $Events[0].ID | Should -Be 5617
    }
}

Describe 'Get-Events - MaxEvents on 3 servers' {
    $Date = (Get-Date).AddDays(-60)
    $Date1 = Get-Date

    $Events = Get-Events -Machine $Env:COMPUTERNAME, $Env:COMPUTERNAME, $Env:COMPUTERNAME -DateFrom $Date -DateTo $Date1 -ID 5617 -LogName 'Application' -MaxEvents 1 -Verbose

    It 'Should have GatheredLogName, GatheredFrom fields properly filled in' {
        $Events[0].GatheredFrom | Should -Be $Env:COMPUTERNAME
        $Events[0].GatheredLogName | Should -Be 'Application'
        $Events[1].GatheredFrom | Should -Be $Env:COMPUTERNAME
        $Events[1].GatheredLogName | Should -Be 'Application'
        $Events[2].GatheredFrom | Should -Be $Env:COMPUTERNAME
        $Events[2].GatheredLogName | Should -Be 'Application'
    }
    It 'Should have exactly 1 event' {
        $Events.Count | Should -BeExactly 3
    }
    It 'Should return an Array' {
        $Events -is [Array] | Should -Be $true
    }
    It 'Should return proper Level' {
        $Events[0].LevelDisplayName | Should -Be 'Information'
        $Events[1].LevelDisplayName | Should -Be 'Information'
        $Events[2].LevelDisplayName | Should -Be 'Information'
    }
    It 'Should return proper LogName' {
        $Events[0].LogName | Should -Be 'Application'
        $Events[1].LogName | Should -Be 'Application'
        $Events[2].LogName | Should -Be 'Application'
    }
    It 'Should return proper ID (EventID)' {
        $Events[0].ID | Should -Be 5617
        $Events[1].ID | Should -Be 5617
        $Events[2].ID | Should -Be 5617
    }
}