<#
	.NOTES
	===========================================================================
	 Created on:   	2019/07/17
	 Created by:   	Jeff Kitay
	 GitHub link: 	https://kitayjb@bitbucket.ncbi.nlm.nih.gov/scm/~kitayjb/adusersvs1.git
	 Twitter: 		
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
$ErrorActionPreference = 'SilentlyContinue'
$InputXML=@"
<Window x:Class="ADUSERSVS1.MainWindow"
        x:Name="MainWindowApp"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:ADUSERSVS1"
        xmlns:forms="clr-namespace:System.Windows.Forms;assembly=System.Windows.Forms"
        mc:Ignorable="d"
        Title="PS Admin" Height="1000" Width="1000" FontSize="10" BorderThickness="2" FontWeight="Bold">
    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>
        <Grid.RowDefinitions>
            <RowDefinition Height="*"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        <!-- This is a comment block -->
        <StackPanel Grid.Column="0" Grid.Row="0" Grid.ColumnSpan="2">
            <Button x:Name="Button_Debug" Content="Debug" Margin="200,0,200,0" IsEnabled="True" Visibility="Visible" />
            <TextBlock x:Name="TxtBlock_FindUser" Text="Find AD User" Padding="1" Margin="0,6,0,6"/>
            <Grid x:Name="Grid_User" Margin="2">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="2*"/>
                    <ColumnDefinition Width="*"/>

                </Grid.ColumnDefinitions>
                <Grid.RowDefinitions>
                    <RowDefinition Height="*"/>
                    <RowDefinition Height="*"/>
                </Grid.RowDefinitions>
                <TextBlock x:Name="TxtBlock_UserName" Text="User Name:" Grid.Row="0" Grid.Column="0" Margin="0,0,5,0" />
                <TextBox x:Name="TxtBox_EnterName" Text="Enter User Name Here" Grid.Row="0" Grid.Column="1" FontWeight="Normal" Margin="2,0,0,2" />
                <Button x:Name="Button_FindADUser" Content="Find AD User" Grid.Row="0" Grid.Column="2" Margin="5,0,0,0" IsEnabled="True" />
            </Grid>

            <TextBlock x:Name="TxtBlock_Users" Text="Matching Users" Padding="1" Margin="0 1" />
            <ListBox x:Name="ListBox_FoundUsers" Width="auto" Height="90" Margin="1 5" BorderThickness="1" Padding="1"  />

            <Grid  >
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>
                <Grid.RowDefinitions>
                    <RowDefinition/>
                    <RowDefinition/>
                    <RowDefinition/>
                </Grid.RowDefinitions>                
                <Button x:Name="Button_ADGroups" Content=" AD Groups of User"  Grid.Column="0" Grid.Row="0" Margin="5,2,5,2"/>
                <Button x:Name="Button_EnableUnixAttributes" Content="Enable Unix Attributes"  Grid.Column="1" Grid.Row="0" Margin="5,2,5,2" IsEnabled="True" />
                <Button x:Name="Button_ExtendedProperties" Content="Extended User Properties"  Grid.Column="2" Grid.Row="0" Margin ="5,2,5,2" />
                
                <Button x:Name="Button_GroupsWithGids" Content="Groups with GIDs"  Grid.Column="0" Grid.Row="1" Margin ="5,2,5,2" />
                <Button x:Name="Button_SyncGroups" Content="Sync Groups" Margin="5,2,5,2" Grid.Column="2" Grid.Row="1" Padding="1"  />
                <Button x:Name="Button_UIDList" Content="UID List"  Grid.Column="0" Grid.Row="2" Margin ="5,2,5,2" />
                <Button x:Name="Button_ModifySelADUser" Content="Save Changes"  Grid.Column="1" Grid.Row="1" Margin="5,2,5,2" Visibility="Visible" IsEnabled="True"  />
                <Button x:Name="Button_ResetForm" Content="Reset Form"  Grid.Column="2" Grid.Row="2" Margin="5,2,5,2"  />
                
                
            </Grid>
            <Border Padding="1" BorderThickness="1" >
                <StackPanel Name="StackPanel1">
                    <TextBlock x:Name="TxtBlock_SelectedUserHeader" Text="Selected User" />
                    <TextBlock x:Name="TxtBlock_SelectedUser" Text="None"/>
                    <TextBlock x:Name="TxtBlock_ResultHeader" Text="Operation Results"/>
                    <TextBlock x:Name="TxtBlock_Result" Text="None" TextWrapping="Wrap"/>
                    <TextBlock x:Name="TxtBlock_MessageHeader" Text="Message"/>
                    <TextBlock x:Name="TxtBlock_Message" Text="None"/>
                </StackPanel>
            </Border>
        </StackPanel>

        <StackPanel x:Name="StackPanel_UserView" Grid.Column="2" Grid.ColumnSpan ="2"  Grid.Row="0" Grid.RowSpan="2">
            <DataGrid x:Name="DataGrid_UserAttributesLookup" Height="460" CanUserReorderColumns="true"  CanUserSortColumns="True" AutoGenerateColumns="False" IsEnabled="True" IsReadOnly="False" >
                <DataGrid.Columns>
                    <DataGridTextColumn  Header="Attribute" Binding="{Binding Attribute}" Width="*" IsReadOnly="True"/>
                    <DataGridTextColumn  Header="Current Value" Binding="{Binding CurrentValue}" Width="*" IsReadOnly="True"/>
                    <DataGridTextColumn  Header="Set New Value" Binding="{Binding NewValue}" Width="*" IsReadOnly="False"/>
                </DataGrid.Columns>
            </DataGrid>
        </StackPanel>
        
        <StackPanel x:Name="StackPanel_GroupsAdd" Grid.Column="0" Grid.ColumnSpan ="2"  Grid.Row="2" Grid.RowSpan="2">
            <DataGrid x:Name="DataGrid_GroupsAdd" Height="460" CanUserReorderColumns="true"  CanUserSortColumns="True" Visibility="Visible" AutoGenerateColumns="False"  >
                <DataGrid.Columns>

                    <DataGridTextColumn Header="SamAccountName" Binding="{Binding SamAccountName}" Width=".75*"/>
                    <DataGridTextColumn Header="GID" Binding="{Binding GID}" Width=".25*"/>
                    <DataGridTextColumn Header="Unix Member" Binding="{Binding UnixMember}" Width=".40*"/>
                    <DataGridTextColumn Header="Member" Binding="{Binding GroupMember}"  Width=".40*"/>
                    <DataGridTextColumn Header="In Both" Binding="{Binding InBoth}"  Width=".25*"/>
                    <DataGridTextColumn Header="Primary" Binding="{Binding Primary}"  Width=".25*"/>
                    <DataGridTextColumn Header="Correct" Binding="{Binding Correct}"  Width=".25*"/>
                </DataGrid.Columns>
            </DataGrid>
            <DataGrid x:Name="DataGrid_GidView" Height="460" CanUserReorderColumns="true"  CanUserSortColumns="True" Visibility="Collapsed" AutoGenerateColumns="False"  >
                <DataGrid.Columns>

                    <DataGridTextColumn Header="SamAccountName" Binding="{Binding SamAccountName}" Width="1*"/>
                    <DataGridTextColumn Header="Unix ID" Binding="{Binding UserUnixID}" Width="*"/>
                </DataGrid.Columns>
            </DataGrid>

        </StackPanel>
        <StackPanel x:Name="StackPanel_GroupsLookup" Grid.Column="2" Grid.ColumnSpan ="2"  Grid.Row="2" Grid.RowSpan="2">
            <DataGrid x:Name="DataGrid_GroupsLookup" Height="460" CanUserReorderColumns="true"  CanUserSortColumns="True" AutoGenerateColumns="False">
                <DataGrid.Columns>

                    <DataGridTextColumn Header="Group Name" Binding="{Binding SamAccountname}" Width="2*"/>
                    <DataGridTextColumn Header="Group ID" Binding="{Binding GID}" Width=".5*"/>
                    <DataGridTextColumn  Width="*"/>
                </DataGrid.Columns>
            </DataGrid>

        </StackPanel>

    </Grid>
</Window>
"@
function Get-XamlObjectFromScript {
		[CmdletBinding()]
		param(
			[Parameter(Position = 0,
				Mandatory = $true,
				ValuefromPipelineByPropertyName = $true,
				ValuefromPipeline = $true)]
			[Alias("")]
			[System.String[]]$XAMLFromScript
		)

		    try{
                $wpfObjects = @{ }
			    Add-Type -AssemblyName presentationframework, presentationcore		
			    [xml]$xaml = $inputXML -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace 'x:Class=".*?"', '' -replace 'd:DesignHeight="\d*?"', '' -replace 'd:DesignWidth="\d*?"', '' -replace '^<Win.*', '<Window'
			    $tempform = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xaml -ErrorAction Stop))
			    #Grab named objects from tree and put in a flat structure using Xpath
			    $namedNodes = $xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")
			    $namedNodes | ForEach-Object {
			        $wpfobjects.Add($_.Name, $tempform.FindName($_.Name))                
				} 
                return $wpfobjects	
			} #try
			catch
			{
				throw $error[0]
			} #catch
           
}
function Get-XamlObject {
		[CmdletBinding()]
		param(
			[Parameter(Position = 0,
				Mandatory = $true,
				ValuefromPipelineByPropertyName = $true,
				ValuefromPipeline = $true)]
			[Alias("FullName")]
			[System.String[]]$Path
		)

		BEGIN
		{
			#Set-StrictMode -Version Latest
			$expandedParams = $null
			$PSBoundParameters.GetEnumerator() | ForEach-Object { $expandedParams += ' -' + $_.key + ' '; $expandedParams += $_.value }

			Write-Verbose "Starting: $($MyInvocation.MyCommand.Name)$expandedParams"
			$wpfobjects = @{ }
			#Add-Type -AssemblyName presentationframework, presentationcore
		} #BEGIN

		PROCESS {
			try
			{
				foreach ($xamlFile in $Path)
				{
					#Change content of Xaml file to be a set of powershell GUI objects
					$inputXML = Get-Content -Path $xamlFile -ErrorAction Stop
					[xml]$xaml = $inputXML -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace 'x:Class=".*?"', '' -replace 'd:DesignHeight="\d*?"', '' -replace 'd:DesignWidth="\d*?"', ''
					$tempform = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xaml))

					#Grab named objects from tree and put in a flat structure using Xpath
					$namedNodes = $xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")
					$namedNodes | ForEach-Object {
						$wpfobjects.Add($_.Name, $tempform.FindName($_.Name))
					} #foreach-object
				} #foreach xamlpath
			} #try
			catch
			{
				throw $error[0]
			} #catch
		} #PROCESS

		END
		{
			
			Write-Verbose "Finished: $($MyInvocation.Mycommand)"
            return $wpfobjects
		} #END
	}

## End Functions
## Get Working Environment
If (Test-Path -LiteralPath 'variable:HostInvocation') { $InvocationInfo = $HostInvocation
    [string]$scriptDirectory = Split-Path -Path $InvocationInfo.MyCommand.Definition -Parent
}ElseIf ($MyInvocation.MyCommand.CommandType -eq "ExternalScript"){
    $ScriptDirectory = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
}ElseIf ($psscriptroot){
    $ScriptDirectory = $psscriptroot
}



Function Change-TxtBoxEnterName($param){
    [cmdletbinding[]]
    $erroractionpreference='continue'
    try{
                    
        if ($param.originalsource.text -match 'enter' -or $param.originalsource.text -match 'name'){
            $param.originalsource.text = ''
        }Elseif ($param.originalsource.text.trim() -eq ''){
            $param.originalsource.text = 'Enter User Name Here'
        }Else{
        Reset-Form -State 'enablefindad'
        }
        
        Result_S
    }
    catch{
        Result_F
        Throw
    }
    Finally{

    }
}
Function Debug-Form ($PlaceHolder){
    write-host 'line1'
    Write-Verbose 'line 1 verbose'
    
    return
}
Function Enable-UnixAttributes($dname){
    [cmdletbinding[]]
    $erroractionpreference='continue'
    try{
                
        if ($dname -ne $null){
            #Modify Buttons

            $user=Get-ADUser -Filter 'DistinguishedName -Like $dname' -Properties * -Server $Domains

            if ($user.mssfu30nisdomain -notmatch 'ncbi'-or [int]$user.uidnumber -lt 1000 -or $user.loginshell.length -lt 4 -or $user.unixHomeDirectory.length -lt 4 -or [int]$user.gidnumber -lt 10){        
            $NIS = Get-ADObject "cn=ncbi,CN=Ypservers,CN=ypserv30,CN=rpcservices,CN=system,dc=ncbi,dc=nlm,dc=nih,dc=gov" -Properties * #Get NIS server information
            $maxUid = $NIS.msSFU30MaxUidNumber
            if($maxUid -le 10000 -or $maxUid -eq 0 -or $maxuid -eq $false -or $maxUid -ge 18000){
                $low  = 13000
                $high = 18000
                $highestuser = Get-AdUser -Filter { uidNumber -gt $low -and uidNumber -lt $high } -Properties uidNumber | Sort-Object -Property uidNumber -Descending | select-object -first 1
                $maxuid = [int]$highestuser.uidNumber + 1

            }
            $MSSFU30NisDOMain="ncbi"
            if ([int]$user.uidnumber -lt 10000){$uidnumber = $maxUid }else{$uidnumber=$user.uidnumber}
            if ($user.loginshell.length -lt 4){$loginshell = '/bin/bash' }else{$loginshell=$user.loginshell}
            if ($user.unixHomeDirectory.length -lt 4){$unixHomeDirectory = '/home/' + "$($user.Name)"}else{$unixHomeDirectory = $user.unixHomeDirectory}
            if ($user.$gidnumber -le 10 ){$gidnumber = 14}else{$gidnumber=$user.$gidnumber} #ncbi
            if ($user.$mssfu30name.length -le 4 ){$mssfu30name = $user.name}else {$mssfu30name=$user.$mssfu30name}
            if ($user.extensionattribute15.length -le 5 ){$extensionattribute15 = "$($user.Name)" +'@nih.gov'} else{$extensionattribute15 = $user.extensionattribute15}#ncbi
            foreach($i in $wpf.DataGrid_UserAttributesLookup.Items){
                switch ($i.attribute){
                'uidnumber'{$i.newvalue = $uidnumber}
                'loginshell'{$i.newvalue = $loginshell}
                'unixHomeDirectory'{$i.newvalue = $unixHomeDirectory}
                'gidnumber'{$i.newvalue = $gidnumber}
                'MSSFU30NisDOMain'{$i.newvalue = $MSSFU30NisDOMain}
                'mssfu30name'{$i.newvalue = $mssfu30name}
                'extensionattribute15'{$i.newvalue = $extensionattribute15}

                }

            }
           
            start-sleep -Milliseconds 5
            }

        }
        Reset-Form -State 'enableunixatt' 
        Result_S
    }
    catch{
            ##Modify Buttons
        Result_F
        Throw
    }
    Finally{
        #Modify Buttons

        $trap= $wpf.DataGrid_UserAttributesLookup.Items.Refresh()
    }
}
Function Find-ADUser($user){
    
    try{
            $wpf.ListBox_FoundUsers.items.clear()
            if ($WPF.TxtBox_EnterName.Text -ne '' -and $WPF.TxtBox_EnterName.Text -notmatch 'here'){
                $WPF.Button_FindADUser.IsEnabled = $false
			                $User =  $WPF.TxtBox_EnterName.Text #Pass any arguments using the ArgumentList parameter 
			                $user = "$user*"

                foreach($Domain in ($Domains)){
	               $user = $user + '*'
                   $FoundUser= Get-ADUser -Filter 'samaccountname -Like $user' -Server $Domains | Select-Object SamAccountName, Enabled, DistinguishedName, UserPrincipleName 
		                if ($null -ne $FoundUser){
                            Foreach ($F in $FoundUser){
                                $WPF.ListBox_FoundUsers.Items.Add([string]$F.distinguishedname)
                            }
                        }
	                }
                }
            #Modify Buttons
            Reset-Form -State 'findadresult'
            result_S      
         }


    
    catch{
        Write-Error $Error	
        result_f
        $WPF.ListBox_FoundUsers.isenabled=$false
        Throw
    }
    Finally{
        if ($WPF.ListBox_FoundUsers.Items.Count -LT 1){
            #NEED TO ADD ERROR HANLDING
            $WPF.ListBox_FoundUsers.Items.Add([string]'No Results Found')
                       		
	        
         }
        #Modify Buttons
        
    }
}
Function Get-ExtendedProperties($dname){
    [cmdletbinding[]]
    $erroractionpreference='continue'
    try{
                   
        if ($dname -ne $null){
            $WPF.DataGrid_UserAttributesLookup.ItemsSource=$null
            $WPF.DataGrid_UserAttributesLookup.Items.refresh()
            $WPF.DataGrid_GroupsAdd.ItemsSource=$null
            $WPF.DataGrid_GroupsAdd.Items.refresh()
            
            # Attributes
            $user=Get-ADUser -Filter 'DistinguishedName -Like $dname' -Properties *  
            $WPF.TxtBlock_SelectedUser.Text=$user.samaccountname                 
            $txtboxes=@{}
            $txtboxes.extensionattribute15=$user.extensionattribute15#
            $txtboxes.uidNumber=$user.uidNumber #
            $txtboxes.loginshell=$user.loginshell #
            $txtboxes.mssfu30name=$user.mssfu30name #
            $txtboxes.msSFU30nisdomain =$user.msSFU30nisdomain #
            $txtboxes.gidnumber=$user.gidnumber #
            $txtboxes.uidnumber=$user.uidnumber #
            $txtboxes.unixhomedirectory=$user.unixhomedirectory #
            [System.Collections.ArrayList]$total =@()
            $t1=$null
            foreach ($tx in $txtboxes.GetEnumerator()){

                $t1 = New-Object psobject -Property @{Attribute=$tx.name;CurrentValue=$tx.value;NewValue=""} 
                $total.Add($t1)           
            
            }
            $total = $total | Sort-Object -Property 'Attribute' -Unique
            $wpf.DataGrid_UserAttributesLookup.itemssource = $total
            start-sleep -Milliseconds 5
            If ($null -eq $user.msSFU30NisDomain -or $user.msSFU30NisDomain -eq '' -or $user.msSFU30NisDomain -notmatch 'ncbi'  ){
            $wpf.Button_EnableUnixAttributes.IsEnabled=$true          
            }
            Else{
            $wpf.Button_EnableUnixAttributes.IsEnabled=$false
            reset-form -state 'getextprops'
            }
            
            Result_s
    
        }
    }
    catch{
    #
        
        Result_F
        Throw
    }
    Finally{
    #
    }
}
Function Get-FormVariables{
    #if ($ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$ReadmeDisplay=$true}
    #write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
    $VAR = Get-Variable | Where-Object{ $_.value -match 'controls'} 
    $VAR
}
Function Get-UIDlist($placeholder){

    [cmdletbinding[]]
    try{
        $erroractionpreference='continue'
        $user = $dname 
        #$wpf.DataGrid_GidView.Items.Clear()
        $wpf.DataGrid_GidView.Items.Refresh()
        [System.Collections.ArrayList]$total =@()
        $R1=$R2=$RTotal=@()    
        $RS1 = Get-ADUser -filter ‘uidNumber -like "*"’ -Properties uidNumber,samaccountname | Where-Object {[int]$_.uidnumber -ge 1} | Sort-Object -Property uidnumber
        $RTotal= $rs1 | Get-Unique -AsString
            foreach ($R in $RTotal){
            $row= New-Object PSObject
            Add-Member -inputObject $row -memberType NoteProperty -name “SamAccountName” -value $($r.samaccountname)
            Add-Member -inputObject $row -memberType NoteProperty -name “UserUnixID” -value $($r.uidNumber)           
            $total += $row
            }

        $Wpf.DataGrid_GroupsAdd.Visibility='collapsed'
        $Wpf.DataGrid_GidView.isreadonly=$true
        $Wpf.DataGrid_GidView.Visibility='visible'
        $WPF.DataGrid_GidView.Itemssource=$total
         Result_S
     }
     Catch{
     Result_F
     }

}
Function Get-GroupsWithGIDs ($placeholder){
    [Cmdletbinding[]]
    try{
        $wpf.DataGrid_GidView.itemssource=$null
        #$wpf.DataGrid_GidView.items.Clear()
        $wpf.DataGrid_GidView.items.Refresh()
        $groups = Get-ADGroup -Filter 'GroupCategory -eq "Security" -and GIDnumber -like "*"' -Server $Domains -Properties * |
        Select-Object  -Property samaccountname, gidnumber,member  | Where-Object {[int]$_.gidnumber -ge 1 -and $_.member.count -ge 2} | 
        Sort-Object -Property samaccountname 
        [System.Collections.ArrayList]$total =@()
        foreach ($G in $Groups){
            $row= New-Object PSObject
            Add-Member -inputObject $row -memberType NoteProperty -name “SamAccountName” -value ($G.samaccountname)
            Add-Member -inputObject $row -memberType NoteProperty -name “gid” -value ($G.gidnumber)
            $total += $row            
        }
        $WPF.DataGrid_GroupsLookup.Isenabled=$true
        $WPF.DataGrid_GroupsLookup.IsReadOnly=$true
        $WPF.DataGrid_GroupsLookup.itemssource=$total
    Result_S
    }
    Catch{
    Result_F
    Throw
    }
}
Function Modify-SelADUser($dname){
    [cmdletbinding[]]
    $erroractionpreference='continue'
    try{            
        if ($true){

            ##     
            $user=Get-ADUser -Filter 'DistinguishedName -Like $dname' -Properties * -Server $Domains   
            $count = 0
            $ReplaceHashTable=@(,"")
            while ( $count -le 5 -and $ReplaceHashTable.Count -gt 0 ){
                Start-Sleep -Milliseconds 1
                $ReplaceHashTable = @{} # hashtable
                $count ++
                foreach ($i in $wpf.DataGrid_UserAttributesLookup.Items){
                    if($i.newvalue -ne "" -and $i.newvalue -ne $null){
                        $attribute=$($i.attribute)
                        $newvalue =$($i.newvalue)
                        $ReplaceHashTable.Add($attribute,$newvalue)                
                    }
                }
                if ($ReplaceHashTable.Count -ge 1){
                    $trap=Set-ADUser -Identity $user -replace $ReplaceHashTable -PassThru
                    Get-ExtendedProperties $wpf.ListBox_FoundUsers.SelectedItem  
                    $wpf.DataGrid_UserAttributesLookup.Items.Refresh()
                    Start-Sleep -Milliseconds 200
                }
            }
            Reset-form -state 'savedchanges'
            Result_S
        }
    }
    catch{
        Result_F
        Throw
    }
    Finally{
        #Modify Buttons
        #$Button_ModifySelADUser.IsEnabled = $TRUE
        Get-ExtendedProperties $wpf.ListBox_FoundUsers.SelectedItem  
        $wpf.DataGrid_UserAttributesLookup.Items.Refresh()
        Start-Sleep -Milliseconds 1
    }
}


Function Result_S(){
$Time= $($(get-date).TimeOfDay.ToString())
    $wpf.TxtBlock_Result.Text="Success at $time"
}
Function Result_F(){
    $Time= $($(get-date).TimeOfDay.ToString())
    [string]$s = $error[0].Exception.Message
    $short_error = $s.substring(0, [System.Math]::Min(200, $s.Length))
    $wpf.TxtBlock_Result.Text="Failure at $time with $short_error "
}
Function Script:Reset-Form($State){
    [cmdletbinding[]]
    $erroractionpreference='continue'
    <#
    IF ($state -match 'start'){
            foreach ($w in $wpf.GetEnumerator()){
                    if ($w.value.tostring() -match 'textblock'){
                    switch -regex ($w.name.tostring()){
                    'txt
                    }
                     
                }
            }
            #$trap = $w | ? { if ($_.value -match 'datagrid'){$_.itemssource = $null }}
            #$trap = $w | ? { if ($_.value -match 'button'){$_.isenabled = $true}}
            #$trap = $w | ? { if ($_.value -match 'listbox'){$_.isenabled = $true; $_.items.clear()}}
            RETURN
    }
    #>
    IF ($state -match 'start'){
        #buttons
        $wpf.Button_ADGroups.isenabled=$false
        $wpf.Button_Debug.isenabled=$false
        $wpf.Button_EnableUnixAttributes.isenabled=$false
        $wpf.Button_ExtendedProperties.isenabled=$false
        $wpf.Button_FindADUser.isenabled=$true
        $wpf.Button_GroupsWithGids.isenabled=$true
        $wpf.Button_ModifySelADUser.isenabled=$false
        $wpf.Button_ResetForm.isenabled=$true
        $wpf.Button_SyncGroups.isenabled=$false
        $wpf.Button_UIDList.isenabled=$false
        $wpf.DataGrid_GidView.isenabled=$false
        $wpf.DataGrid_GroupsAdd.isenabled=$false
        $wpf.DataGrid_GroupsLookup.isenabled=$false
        $wpf.DataGrid_UserAttributesLookup.isenabled=$false
        $wpf.Button_Debug.visibility='hidden'
        #wpf.datagrid
        $wpf.DataGrid_GidView.Itemssource=$null
        $wpf.DataGrid_GroupsAdd.Itemssource=$null
        $wpf.DataGrid_GroupsLookup.Itemssource=$null
        $wpf.DataGrid_UserAttributesLookup.Itemssource=$null
        $wpf.DataGrid_GidView.Visibility='collapsed'
        $wpf.DataGrid_GroupsAdd.Visibility='visible'
        $wpf.DataGrid_GroupsLookup.Visibility='visible'
        $wpf.DataGrid_UserAttributesLookup.Visibility='visible'
        $wpf.DataGrid_UserAttributesLookup.isenabled=$false
        $wpf.DataGrid_GroupsAdd.isenabled=$false
        $wpf.DataGrid_GroupsLookup.isenabled=$false
        #wpf.listbox
        $wpf.ListBox_FoundUsers.items.clear()
        #wpf.Txtblock
        $wpf.TxtBlock_Message.text='none'        
        $wpf.TxtBlock_Result.text ='none'        
        $wpf.TxtBlock_SelectedUser.text ='none'
        #wpf.TxtBox
        $wpf.TxtBox_EnterName.text ='Enter User Name Here'
        return   


    }
      IF ($state -match 'findadresult'){
        #buttons
        
        $wpf.Button_ExtendedProperties.isenabled=$true
        
        $WPF.ListBox_FoundUsers.isenabled=$true          
        #wpf.datagrid      
        #wpf.listbox        
        #wpf.Txtblock 
        #wpf.TxtBox        
        return   


    }
          IF ($state -match 'enablefindad'){
        #buttons  
        
        #wpf.datagrid      
        #wpf.listbox        
        #wpf.Txtblock 
        #wpf.TxtBox        
        return   


    }
    IF ($state -match 'enableunixatt'){
    $wpf.Button_ExtendedProperties.IsEnabled=$false
    $wpf.Button_ModifySelADUser.isenabled=$true
    $wpf.Button_EnableUnixAttributes.isenabled=$false
    $wpf.ListBox_FoundUsers.IsEnabled=$false
    $wpf.DataGrid_UserAttributesLookup.isenabled=$true
    return
    }
    IF ($state -match 'savedchanges'){
        $wpf.Button_ExtendedProperties.IsEnabled=$false
        $wpf.Button_ModifySelADUser.isenabled=$true
        $wpf.Button_EnableUnixAttributes.isenabled=$false
        $wpf.Button_ADGroups.isenabled=$true
        $wpf.ListBox_FoundUsers.IsEnabled=$false
        $wpf.DataGrid_UserAttributesLookup.isenabled=$true
        return
    }
        IF ($state -match 'getextprops'){
        $wpf.Button_ADGroups.IsEnabled=$true
        $wpf.Button_ModifySelADUser.isenabled=$true
        $wpf.Button_ExtendedProperties.isenabled=$false
        $wpf.ListBox_FoundUsers.IsEnabled=$false
        $wpf.DataGrid_UserAttributesLookup.isenabled=$true
        return
    }
        IF ($state -match 'datagridadpopulate'){
        $Wpf.DataGrid_GidView.Visibility='collapsed'
        $WPF.DataGrid_GroupsAdd.Visibility='visible'
        $WPF.DataGrid_GroupsAdd.isenabled=$true
        $WPF.DataGrid_GroupsAdd.isreadonly=$true
        $wpf.Button_SyncGroups.isenabled=$true
        return
    }

}
Function Select-ADgroups($dname){

    [cmdletbinding[]]
    try{
        $erroractionpreference='continue'
        $user = $dname 
        $Instance = $null
        $wpf.DataGrid_GroupsAdd.itemssource=$null

        [System.Collections.ArrayList]$total =@()
        $R1=$R2=$RTotal=$total=$PrimaryGroup=@()
        $Instance = Get-ADUser $User -Properties *     
        $RS1 = Get-ADUser -Identity $user -Properties MemberOf | Select-Object -ExpandProperty memberof
        $RS2 = Get-ADUser -Identity $user -Properties msSFU30PosixMemberOf  | Select-Object -ExpandProperty msSFU30PosixMemberOf  
        $RS3 = [int]$Instance.gidnumber
        $PrimaryGroup = Get-ADGroup -Filter 'GIDnumber -eq $Rs3'| Select-Object -Property 'DistinguishedName' -ExpandProperty 'DistinguishedName' 
        $RTotal += $rs1
        $RTotal += $rs2
        $RTotal += $PrimaryGroup
        $RTotal = $RTotal | Sort-Object -Unique

        foreach ($group in $RTotal){
            $r1=$r2=$r3=$r4=$r5=$r6=$r7=""
            $a1=$a2=$a3=$a4=$a5=$a6=$a7=""
            #Unix Member
            $A1 = Get-ADGroup  -Identity $group -Properties * | Select-Object -ExpandProperty mssfu30posixmember 
            $r1 = $USER -IN $A1
            #MEMBER
            $A2 = Get-ADGroup  -Identity $group -Properties * | Select-Object -ExpandProperty member 
            $R2 = $USER -IN $A2
            #GID
            $A3 = Get-ADGroup  -Identity $group -Properties * | Select-Object -ExpandProperty gidnumber #5322
            $R3= $Instance.gidnumber -in $a3
            $A4 = Get-ADGroup  -Identity $group -Properties * | Select-Object -Expandproperty samaccountname 
            $R4= $A4
            #Compare
            $a5 = if ($r1 -and $r2){
                $r5 = $true
            }
            #Primary
            $a6 = if ($r3 -and ([int]$a3 -gt 0)){
                $r6 = $true
            }
            #Correct
            if ($r6 -and $r2 -and -not $r1){
            $r7 = $true
            }elseif((-not $r6) -and ($r1 -and $r2) ){
                $r7 = $true
            }elseif((-not $r6) -and ((-not $r1) -and (-not $r2)) ){
                $r7 = $true
            }elseif((-not $a3) -and ((-not $r1) -and $r2) ){ 
                $r7 = $true
            }else {
            $r7=$false
            }
            $row= New-Object PSObject
            Add-Member -inputObject $row -memberType NoteProperty -name “SamAccountName” -value ($r4)
            Add-Member -inputObject $row -memberType NoteProperty -name “GID” -value $A3
            Add-Member -inputObject $row -memberType NoteProperty -name “UnixMember" -value $r1
            Add-Member -inputObject $row -memberType NoteProperty -name “GroupMember” -value $r2
            Add-Member -inputObject $row -memberType NoteProperty -name “InBoth” -value $r5
            Add-Member -inputObject $row -memberType NoteProperty -name “Primary” -value $r6
            Add-Member -inputObject $row -memberType NoteProperty -name “Correct” -value $r7
            
            $total += $row
    
        }
        $WPF.DataGrid_GroupsAdd.Itemssource=$null        
        $WPF.DataGrid_GroupsAdd.Itemssource=$total
        $Wpf.DataGrid_GroupsAdd.Items.Refresh()
        Reset-Form -State 'datagridadpopulate'
        $wpf.DataGrid_GroupsAdd.Items.Refresh()
        Start-Sleep -Milliseconds 1
        Result_S
     }
     Catch{
      Result_F
     }
     Finally{
      
     }

}
Function Sync-Groups($dname){
    [cmdletbinding[]]
        $erroractionpreference='continue'
    try{
        
        $user=Get-ADUser -Filter 'DistinguishedName -Like $dname' -Properties * -server $domains
        $count = 0
        $total=@("","")
        while ($count -lt 5 -and $total.Count -gt 0){
            $count ++
            $nameusr = $user.samaccountname
            $gidnumberusr = $user.gidnumber
            $uidnumberusr = $user.uidnumber
            $dnusr = $user.distinguishedname
            $msSFU30PosixmemberAdd=@()
            $memberAdd=@()
            $msSFU30PosixmemberRemove=@()
            $memberRemove=@()
            $total=@()
            foreach($I in $wpf.DataGrid_GroupsAdd.Items){
                $groupsamaccount =$($i.samaccountname)
                $groupmember =$($i.groupmember)
                $groupunixmember =$($i.unixmember)
                $group=""
                $msSFU30PosixmemberAdd=@()
                $memberAdd=@()
                $msSFU30PosixmemberRemove=@()
                $memberRemove=@()
                If ($i.correct -ne $true -and $i.primary -eq $true -and $i.gid -ge 1){    
                    $msSFU30PosixmemberRemove += $groupsamaccount
                    $memberAdd+= $groupsamaccount
                    $Group = $groupsamaccount
                }    
                elseIf ($i.correct -ne $true -and $i.primary -ne $true -and $i.gid -ge 1 -and $groupmember){    
                    $msSFU30PosixmemberAdd += $groupsamaccount
                    #$memberRemove += $groupsamaccount
                    $Group = $groupsamaccount
                }
                elseIf ($i.correct -ne $true -and $i.primary -ne $true -and $i.gid -ge 1 -and -not $groupmember){    
                    $msSFU30PosixmemberRemove+= $groupsamaccount
                    #$memberRemove += $groupsamaccount
                    $Group = $groupsamaccount
                }
               If ($Group -ne ""){
               $groupobject = Get-ADgroup -Identity $groupsamaccount
               $dn = $groupobject.distinguishedname
               $guidgroup = $groupobject.objectguid            
               $row= New-Object PSObject
               Add-Member -inputObject $row -memberType NoteProperty -name “GroupGUID" -value $($guidgroup) 
               Add-Member -inputObject $row -memberType NoteProperty -name “SamAccountName” -value $Group
               Add-Member -inputObject $row -memberType NoteProperty -name “DN” -value $dn #group
               Add-Member -inputObject $row -memberType NoteProperty -name “msSFU30PosixmemberRemove" -value $($msSFU30PosixmemberRemove)
               Add-Member -inputObject $row -memberType NoteProperty -name “msSFU30PosixmemberAdd" -value $($msSFU30PosixmemberAdd)    
               Add-Member -inputObject $row -memberType NoteProperty -name “memberRemove" -value $($memberRemove) 
               Add-Member -inputObject $row -memberType NoteProperty -name “memberAdd" -value $($memberAdd)
                                   
               $total += $row 
           }
             }         
            foreach ($t in $total){

                if ($t.msSFU30PosixmemberAdd) { Get-adobject  -Identity $t.GroupGUID | Set-ADObject -Add @{msSFU30PosixMember="$dnusr";memberuid=$nameusr} -PassThru} 
                if ($t.memberAdd) { Get-adobject  -Identity $t.GroupGUID |Set-ADObject -Add @{Member="$dnusr";memberuid=$nameusr} -PassThru}  
                if ($t.msSFU30PosixmemberRemove) { Get-adobject  -Identity $t.GroupGUID |Set-ADObject -Remove @{msSFU30PosixMember="$dnusr";memberuid=$nameusr} -PassThru} 
                if ($t.memberRemove) {Get-adobject  -Identity $t.GroupGUID |Set-ADObject -Remove @{Member="$dnusr";memberuid=$nameusr} -PassThru}  
            
 
            }
        Select-ADgroups $dname
        Start-Sleep -Milliseconds 200
            
        }      
        Result_S

     }
     Catch{
     Result_F
     }
     Finally{
     Select-ADgroups $dname
     start-sleep -Milliseconds 1
     }
}
try{
    $path = $scriptDirectory
    $wpf = Get-ChildItem -Path $path -Filter *.xaml -file | Where-Object { $_.Name -match 'mainwindow.xaml' } | Get-XamlObject
    If(($null -eq $wpf) -or ($wpf.Count -le 1)){
        $wpf= Get-XamlObjectFromScript $InputXML
    }
}
Catch{
    throw
}
try{
    Import-Module ActiveDirectory 
    Write-Verbose "Module exists and imported with command Import-Module ActiveDirectory"
}
catch{
Throw Write-Warning "Module ActiveDirectory does not exist"
}
try{
    #####################################################
    # Getting names of all domains in the forest
    ###################################################
    $objForest = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
    $DomainList = @($objForest.Domains | Select-Object -expandProperty Name)
    $Domains = $DomainList | foreach-Object { if ($_ -match 'ncbi.nlm.nih.gov'){$_}}
    #####################################################
    # Looking for the username in each domain
    ###########################################
}
catch{
    Throw Write-warning "Cannot Conntect to AD"
}


$WPF.Button_ADGroups.Add_Click({Select-ADgroups $WPF.ListBox_FoundUsers.SelectedItem})
$WPF.Button_Debug.Add_Click({Debug-Form})
$WPF.Button_ExtendedProperties.Add_Click({Get-ExtendedProperties $WPF.ListBox_FoundUsers.SelectedItem})
$WPF.Button_EnableUnixAttributes.Add_Click({ Enable-UnixAttributes $WPF.ListBox_FoundUsers.SelectedItem})
$WPF.Button_GroupsWithGids.Add_Click({ Get-GroupsWithGIDs })
$WPF.Button_FindADUser.Add_Click({Find-ADUser})
$WPF.Button_ModifySelADUser.Add_Click({Modify-SelADUser $WPF.ListBox_FoundUsers.SelectedItem}) #save changes
$WPF.Button_ResetForm.Add_Click({Reset-Form -State 'start'})
$WPF.Button_SyncGroups.Add_Click({Sync-Groups $WPF.ListBox_FoundUsers.SelectedItem})
$WPF.Button_UIDList.Add_Click({Get-UidList})
$WPF.DataGrid_UserAttributesLookup.Add_LostFocus({""})
$WPF.ListBox_FoundUsers.add_MouseDoubleClick({Get-ExtendedProperties $WPF.ListBox_FoundUsers.SelectedItem})
$WPF.TxtBox_EnterName.Add_gotfocus({Change-TxtBoxEnterName $_})
$WPF.TxtBox_EnterName.Add_lostfocus({Change-TxtBoxEnterName $_})






Write-Verbose 'Testing'
Reset-Form -State 'Start'
$wpf.MainWindowApp.ShowDialog() | Out-Null