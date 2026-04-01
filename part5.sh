#!/bin/bash 

generate_report()
{
	local  report_file="./final_report.txt"
	touch $report_file

	echo "=============================================" >> $report_file
	echo "report generated at : $(date +%Y%m%d%H%M%S)" >> $report_file
	echo "Backup Location : ./project_backups" >> $report_file
	echo "=============================================="

        error_count=$(wc -l < ./errors.txt)
        echo "Number Of Errors Found : $error_count" >> $report_file
	echo "Tools Status :" >> $report_file

	
        for tool in ${tools[@]}
        do
                if command -v $tool &> /dev/null;
                then
                        echo "$tool is already installed" >> $report_file
                else
                        echo "$tool is not installed" >> $report_file
                fi
        done
}
