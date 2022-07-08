//
//  ReadJsonFileCountryFromLocal.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 25/05/2022.
//

import Foundation

public class ReadJsonFileCountryFromLocal
{
    @Published var countriesCode = [CountryCode]()
    
    init()
    {
        readJsonSaveCountriesCode()
    }
    func readJsonSaveCountriesCode()
    {
        if let fileJsonCountry = Bundle.main.url(forResource: "countryDialCode", withExtension: "json")
        {
            do{
                let data = try Data(contentsOf: fileJsonCountry)
                let dataFromJson = try JSONDecoder().decode([CountryCode].self, from: data)
                self.countriesCode = dataFromJson
            }catch
            {
                print(error.localizedDescription)
            }
        }
    }
    
}
