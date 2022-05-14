import { LightningElement,track, wire } from 'lwc';
import getHTMLBody from '@salesforce/apex/ArticlesResponse.getHTMLBody';
import BBC_DOWN from '@salesforce/resourceUrl/BBC_Down';

export default class BbcArticles extends LightningElement {

   @track articles = []
    bbcDownUrl = BBC_DOWN
    @wire(getHTMLBody)
    tenMostReadArticles({error,data}){
        if(error){
            this.articles = false
            if(!data){
                return
            }
        }
        console.log(data)
        const parsed = new DOMParser().parseFromString(data, 'text/html');
        const items = parsed.querySelectorAll('div.nw-c-most-read__items ol li');
        console.dir(items);
        const articles = [...items].map((item,index) => ({
            url: item.querySelector('li a').href,
            text: item.querySelector('li a span').innerText,
            number: index+1
        }))

        for (const article of articles) {
            const url = new URL(article.url)
            url.hostname = 'www.bbc.com'
            article.url = url.href
        }

        this.articles = articles
    }
}
